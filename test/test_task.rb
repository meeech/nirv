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

    # more destructive. No way to recover (afaik) via ui
    # here more as an example than anything else.
    def test_delete_task
      result = @nirvana.delete @task['id']
      result = JSON.parse(result)

      assert result.keys.include?('results')
      assert result['results'][0]
      assert result['results'][0].keys.include?('task')
      assert "0" != result['results'][0]['task']['deleted']      
    end

    def test_undelete_task
      result = @nirvana.undelete @task['id']
      result = JSON.parse(result)

      assert result.keys.include?('results')
      assert result['results'][0]
      assert result['results'][0].keys.include?('task')
      assert_equal "0", result['results'][0]['task']['deleted']      
      
      # pause for a sec, to make sure delete timestamp is later. clean up
      sleep 1
      @nirvana.delete @task['id']
    end

    def test_backup
      assert false
    end

  end

end