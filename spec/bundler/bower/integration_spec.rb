require 'spec_helper'

describe "Integration test" do
  let(:directory) { File.join(File.dirname(__FILE__), "../../dummy") }
  let(:test_node) { TestNode.new(:gemfile => "#{directory}/Gemfile", :type => "install") }

  before { Dir.chdir(directory) { test_node.spawn } }
  after  { FileUtils.rm_rf("#{ directory}/vendor") }

  it "download backbone" do
    File.exist?("#{directory}/vendor/assets/bower_components/backbone/backbone.js").should be_true
  end
end
