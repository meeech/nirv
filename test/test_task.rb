require File.dirname(__FILE__) + "/helper"

module NirvanaHQTests

  class NirvanaHQTaskTest < Test::Unit::TestCase
    def setup
      @nirvana = NirvanaHQ.new $nirvana_config
      @task = JSON.parse(task_json)
    end

    # Will need to rethink this test, or need to get the hang of stubbin, 
    # since running against a live account will make it lag eventually as tasks get larger.
    # Maybe speak with E for a new account special just for testing.
    def test_everything
      results = @nirvana.everything
      keys = []
      results.each do | obj |
        keys << obj.keys.to_s
      end
      assert keys.include? "user"
      assert keys.include? "task"
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
    
    # this fails when run as part of all the tests, but is fine when run solo, after running add.
    # most likely just a timeing issue or order of tests issue. 
    # need depends on, which should be part of a testing lib somewhere.
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

  end

end