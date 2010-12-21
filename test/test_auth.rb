require "helper"

module NirvanaHQTests
  
  class NirvanaHQAuthTest < Test::Unit::TestCase
  
    def setup
      @nirvauth = NirvanaHQ::Auth.new $nirvana_config
    end
  
    def test_token_file_exists
      assert File.exists?(NirvanaHQ::Auth::TOKEN_FILE)
    end
    
    def test_fetch_token
      token = @nirvauth.fetch_token
      assert_equal 32, token.length
    end

    def test_save_token_should_raise_empty_token_error
      #@q not sure if this best way to handle a raise? 
      # since its runtime error, there could be some other RTE error
      # how can i check the message? 
      assert_raise RuntimeError do
        @nirvauth.save_token!(nil)        
      end
    end
    
  end
  
end