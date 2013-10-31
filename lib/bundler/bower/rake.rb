require 'json'
require 'bower-rails'

module Bundler
  module Bower
    class Rake
      def initialize(options)
        @options = options
      end

      def perform
        dsl = BowerRails::Dsl.evalute("Gemfile")

        dsl.write_bower_json
        dsl.write_dotbowerrc

        dsl.directories.each do |dir|
          Dir.chdir(dir) do
            system(command)
            system('bower list')
          end
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
