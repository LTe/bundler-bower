require "bundler/bower/version"
require "bundler"
require "bower-rails"
require "bundler/bower/fake_dsl/bundler"
require "bundler/bower/fake_dsl/bower-rails"
require "bundler/bower/bundler_installer"

Bundler::Dsl.send(:include, Bundler::Bower::FakeDsl::Bundler)
BowerRails::Dsl.send(:prepend, Bundler::Bower::FakeDsl::BowerRails)
Bundler::Installer.send(:prepend, Bundler::Bower::BundlerInstaller)
