require 'spec_helper'

module Bundler::Bower
  describe Rake do
    let(:options) { {} }
    subject { Rake.new(options) }

    describe "during bundle (install)" do
      describe "#update?" do
        it "returns false" do
          subject.update?.should be_false
        end
      end

      describe "#command" do
        it "returns 'bower install'" do
          subject.command.should == "bower install"
        end
      end
    end

    describe "during bundle update" do
      let(:options) { {"update" => true} }

      describe "#update?" do
        it "returns true" do
          subject.update?.should be_true
        end
      end

      describe "#command" do
        it "returns 'bower install'" do
          subject.command.should == "bower update"
        end
      end
    end
  end
end
