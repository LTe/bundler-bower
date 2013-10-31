require 'bbq/spawn'

class TestNode
  include Bbq::Spawn

  attr_reader :type, :gemfile

  def initialize(options = {})
    @type    = options[:type] || "install"
    @gemfile = options[:gemfile] || "Gemfile"
  end

  def spawn
    orchestrator.start
  end

  def stop
    orchestrator.stop
  end

  private

  def executor
    executor = Executor.new("bundle", type)
    process = executor.instance_variable_get(:@process)
    process.environment["BUNDLE_GEMFILE"] = gemfile

    executor
  end

  def orchestrator
    @orchestrator ||= Orchestrator.new.tap do |orchestrator|
      orchestrator.coordinate(executor, :banner => "Your bundle is complete!")
    end
  end
end
