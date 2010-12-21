require "test_helper"

module NirvanaHQAuthTests
  
  class NirvanaHQAuthTest < Test::Unit::TestCase
    
    def test_fetch_token
      token = ''
      assert_equal 36, token.length
    end
    
  end
  
end