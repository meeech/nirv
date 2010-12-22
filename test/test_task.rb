require File.dirname(__FILE__) + "/helper"

module NirvanaHQTests

  class NirvanaHQTaskTest < Test::Unit::TestCase
    def setup
      @nirvana = NirvanaHQ.new $nirvana_config
      @task = JSON.parse(task_json)
    end

    def test_add_task
      # task.add expects a hash
      result = @nirvana.add @task
      result = JSON.parse(result)

      assert result.keys.include?('results')
      assert result['results'][0]
      assert result['results'][0].keys.include?('task')
      assert_equal @task["id"], result['results'][0]['task']['id']
    end

    def test_get_task

      assert false
    end
    
    def test_trash_task
      result = @nirvana.trash @task['id']
      result = JSON.parse(result)

      assert result.keys.include?('results')
      assert result['results'][0]
      assert result['results'][0].keys.include?('task')
      assert_equal "6", result['results'][0]['task']['state']
    end 

  end

end