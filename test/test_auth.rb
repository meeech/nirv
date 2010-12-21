require "helper"

module NirvanaHQAuthTests
  
  class NirvanaHQAuthTest < Test::Unit::TestCase
    
    def test_fetch_token
      token = '1231231231231312312312333123111111'
      assert_equal 36, token.length
    end
    
  end
  
end