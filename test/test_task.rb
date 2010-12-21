require "helper"

module NirvanaHQTests

  class NirvanaHQTaskTest < Test::Unit::TestCase
    def setup
      @nirvauth = NirvanaHQ::Auth.new $nirvana_config
      @nirvtask = NirvanaHQ::Task
    end
# @bookmark
# maybe just make everything one class, but can still keep sep?
# or just create a master class to inject these pieces into?
    def test_add_task
      @nirvtask.add task_json
    end
  end

end