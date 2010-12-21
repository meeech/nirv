require 'helper'
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

    def test_add

      assert false
    end

  end
  
end