require 'helper'

class TestNirvanahq < Test::Unit::TestCase

  def setup
    @nirvHQ = nil
  end

  should "initialize NirvanaHQ when passing in a config" do

    config = {
      :username => 'm', 
      :password => '7615cc2f4ad2d1aecd67280d05fb7176'
    }
    
    @nirvHQ = NirvanaHQ.new config

    assert_equal NirvanaHQ, @nirvHQ.class
    
    #stupid question - but how do you test private instance vars? 
    # ie: i added an accessor on nirvHQ.username, nirvHQ.password
    # but i don't necessarily want them accessible in the final class.
    assert_equal @nirvHQ.username, config[:username]
    assert_equal @nirvHQ.password, config[:password]
    # flunk "hey buddy, you should probably rename this file and start testing for real"
  end
  
  should "get an auth token" do
    assert_equal @nirvHQ.username, 'foo'
  end
  
end
