require File.dirname(__FILE__) + "/helper"
require "nirv"

# Used to capture output, which we can then check against.
require 'stringio'
 
module Kernel
 
  def capture_stdout
    out = StringIO.new
    $stdout = out
    yield
    return out
  ensure
    $stdout = STDOUT
  end
 
end
# End Capture Output override

module NirvanaHQTests

  class TestNirvConsole < Test::Unit::TestCase

    def test_method_missing
      out = capture_stdout do
        SimpleConsole::Application.run([:fakeaction], Controller, View)
      end

      assert out.string.include? "Method fakeaction does not exist"
    end

    def test_nirvanahq_instance
      console = Controller.new
      assert_equal NirvanaHQ, console.nirvana.class
    end

    def test_version
      out = capture_stdout do
        SimpleConsole::Application.run([:version], Controller, View)
      end
      assert out.string.include? " - "
    end

    # @todo can we store the UUID to use in test_delete?
    def test_add
      task_name = "Test Task Add"
      out = capture_stdout do
        SimpleConsole::Application.run([:add, task_name], Controller, View)
      end

      assert_equal out.string, "Added task: #{task_name}\n"
    end
    
    def test_backup
      assert false
    end
    

  end
  
end