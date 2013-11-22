require 'spec_helper'

describe "Integration test" do
  let(:test_node) { TestNode.new(:gemfile => "#{directory}/Gemfile", :type => "install") }

  before { Dir.chdir(directory) { test_node.spawn } }
  after  { FileUtils.rm_rf("#{ directory}/vendor") }

  describe "Gemfile" do
    let(:directory) { File.join(File.dirname(__FILE__), "../../dummy") }

    it "download backbone" do
      File.exist?("#{directory}/vendor/assets/bower_components/backbone/backbone.js").should be_true
    end
  end

  describe "Bowerfile" do
    let(:directory) { File.join(File.dirname(__FILE__), "../../dummy_bowerfile") }

    it "download backbone" do
      File.exist?("#{directory}/vendor/assets/bower_components/backbone/backbone.js").should be_true
    end
  end

  describe "bower.json" do
    let(:directory) { File.join(File.dirname(__FILE__), "../../dummy_bower_json") }

    it "download backbone" do
      File.exist?("#{directory}/vendor/assets/bower_components/backbone/backbone.js").should be_true
    end
  end
end
