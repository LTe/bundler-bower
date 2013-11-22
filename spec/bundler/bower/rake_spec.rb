require 'spec_helper'

module Bundler::Bower
  describe Rake do
    let(:options) { {} }
    subject { Rake.new(options) }

    describe "recognize dependency file" do
      before { stub(Dir).entries(any_args) { files } }

      context "only Gemfile" do
        let(:files) { ["Gemfile", "other-file" ].shuffle }

        it "returns Gemfile as dependency file" do
          subject.dependency_file.should == "Gemfile"
        end
      end

      context "Bowerfile and Gemfile" do
        let(:files) { ["Gemfile", "Bowerfile", "other-file" ].shuffle }

        it "returns Bowerfile" do
          subject.dependency_file.should == "Bowerfile"
        end
      end

      context "bower.json, Bowerfile and Gemfile" do
        let(:files) { ["Gemfile", "Bowerfile", "bower.json", "other-file" ].shuffle }

        it "returns bower.json" do
          subject.dependency_file.should == "bower.json"
        end
      end
    end

    describe "stategy for DSL and .json format" do
      describe "for DSL" do
        ["Gemfile", "Bowerfile"].each do |file|
          describe file do
            before { stub(subject).dependency_file { file }  }

            it "execute DSL strategy for #{file}" do
              mock(subject).perform_dsl(file)
              subject.perform
            end
          end
        end
      end

      describe "for .json file" do
        describe "bower.json" do
          before { stub(subject).dependency_file { "bower.json" }  }

          it "execute standard strategy for bower.json" do
            mock(subject).perform_json
            subject.perform
          end
        end
      end
    end

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
