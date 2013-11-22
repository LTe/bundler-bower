require 'bundler/bower/rake'

module Bundler
  module Bower
    module BundlerInstaller
      def self.included(base)
        base.class_eval do
          alias :old_run :run

          def run(options)
            result = old_run(options)
            Bundler::Bower::Rake.new(options).perform
            result
          end
        end
      end
    end
  end
end

