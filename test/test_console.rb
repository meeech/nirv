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

  class TestLibraryFileName < Test::Unit::TestCase

    def test_method_missing
      out = capture_stdout do
        SimpleConsole::Application.run([:fakeaction], Controller, View)
      end

      assert_equal out.string, 'foo'
    end

  end
  
end