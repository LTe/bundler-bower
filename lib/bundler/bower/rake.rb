require 'json'
require 'bower-rails'

module Bundler
  module Bower
    class Rake
      DEPENDENCY_FILES = %w{bower.json Bowerfile Gemfile}.freeze

      def initialize(options)
        @options = options
      end

      def dependency_file
        entries = Dir.entries(Dir.pwd)
        DEPENDENCY_FILES.detect { |file| entries.include?(file) }
      end

      def perform
        case dependency_file
          when "Gemfile"    then perform_dsl("Gemfile")
          when "Bowerfile"  then perform_dsl("Bowerfile")
          when "bower.json" then perform_json
        end
      end

      def perform_dsl(file)
        dsl = BowerRails::Dsl.evalute(file)

        dsl.write_bower_json
        dsl.write_dotbowerrc

        dsl.directories.each do |dir|
          Dir.chdir(dir) do
            system(command)
            system('bower list')
          end
        end
      end

      def perform_json(remove_components = true)
        bower_root  = Dir.pwd
        json        = JSON.parse(File.read(File.join(bower_root, "bower.json")))
        dot_bowerrc = JSON.parse(File.read(File.join(bower_root, '.bowerrc'))) rescue {}

        dot_bowerrc["directory"] = "bower_components"

        if (json.keys - ['lib', 'vendor']).empty?
          folders = json.keys
        else
          raise "Assuming a standard bower package but cannot find the required 'name' key" unless !!json['name']
          folders = ['vendor']
        end

        folders.each do |dir|
          puts "\nInstalling dependencies into #{dir}"
          data = json[dir]
          data = json if data.nil?

          dir = File.join(bower_root, dir, "assets")
          FileUtils.mkdir_p dir unless File.directory? dir

          Dir.chdir(dir) do
            FileUtils.rm_rf("bower_components") if remove_components
            File.open("bower.json", "w") { |f| f.write(data.to_json) }
            File.open(".bowerrc", "w") { |f| f.write(JSON.pretty_generate(dot_bowerrc)) }

            system(command)
            system('bower list')

            FileUtils.rm("bower.json")
            FileUtils.rm(".bowerrc")
          end if data && !data["dependencies"].empty?
        end
      end

      def update?
        @options["update"]
      end

      def command
        if update?
          'bower update'
        else
          'bower install'
        end
      end
    end
  end
end
