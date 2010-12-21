require "helper"
require 'yaml'

module NirvanaHQTests

  class NirvanaHQTaskTest < Test::Unit::TestCase
    def setup
      @nirv = NirvanaHQ.new $nirvana_config
      @task = JSON.parse(task_json)
    end

    def test_add_task
      # task.add expects a hash

      result = @nirv.add @task

      result = JSON.parse(result)

      assert result.keys.include?('results')
      assert result['results'][0]
      assert result['results'][0].keys.include?('task')
    end
  end

end