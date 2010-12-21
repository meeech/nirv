require "helper"

module NirvanaHQAuthTests
  
  class NirvanaHQAuthTest < Test::Unit::TestCase

    def setup
      @nirvauth = NirvanaHQ::Auth.new $nirvana_config
    end

    # def test_token_file_exists
    #   assert File.exists?(NirvanaHQ::Auth::TOKEN_FILE)
    # end
    
    def test_fetch_token
      token = @nirvauth.fetch_token
      assert_equal 32, token.length
    end
    
  end
  
end