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

  class NirvanaHQConsoleDataTest < Test::Unit::TestCase

    def test_init
      out = capture_stdout do
        SimpleConsole::Application.run([:init], NirvController, NirvView)
      end
      config_path = NirvController::CONFIG_FILE
      assert File.exists?(config_path), "Missing Config File: #{config_path}"
    end

  end

  class NirvanaHQConsoleTest < Test::Unit::TestCase

    def test_method_missing
      out = capture_stdout do
        SimpleConsole::Application.run([:fakeaction], NirvController, NirvView)
      end
      assert out.string.include? "Method fakeaction does not exist"
    end

    def test_nirvanahq_instance
      console =NirvController.new
      assert_instance_of NirvanaHQ, console.nirvana
    end

    def test_version
      out = capture_stdout do
        SimpleConsole::Application.run([:version], NirvController, NirvView)
      end
      assert out.string.include? " - "
    end

    # @todo can we store the UUID to use in test_delete?
    def test_add
      task_name = "Test Task Add"
      out = capture_stdout do
        SimpleConsole::Application.run([:add, task_name], NirvController, NirvView)
      end

      assert_equal out.string, "Added task: #{task_name}\n"
    end
    
    def test_backup
      SimpleConsole::Application.run([:backup], NirvController, NirvView)
      assert File.exists? NirvController::BACKUP_FILE
    end
    

  end
  
end