require "helper"

module NirvanaHQTests

  class NirvanaHQTaskTest < Test::Unit::TestCase
    def setup
      @nirvauth = NirvanaHQ::Auth.new $nirvana_config
      @nirvtask = NirvanaHQ::Task
    end
    
    def test_add_task
      @nirvtask.add task_json
    end
  end

end