require 'bundler/bower/rake'

module Bundler
  module Bower
    module BundlerInstaller
      def run(options)
        result = super
        Bundler::Bower::Rake.new(options).perform
        result
      end
    end
  end
end

