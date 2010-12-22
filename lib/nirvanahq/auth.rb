class NirvanaHQ

  attr_accessor :username
  attr_accessor :password

  TOKEN_FILE = "#{ENV['HOME']}/.nirvanahq/token"

  def initialize config
  
    @username= config[:username]
    @password= config[:password]

    begin
      # is this the spot to check is the dir exists? 
      File.new(TOKEN_FILE, 'w').write('') 
    end unless File.exists?(TOKEN_FILE) 

    @token = File.open(TOKEN_FILE, 'r').read

    if @token.empty? then
      save_token!(fetch_token)
    end

  rescue "EmptyToken"
    puts "Token Issues."
  end

  def fetch_token
    puts "Fetching your token..."
    result = `curl -sX POST 'https://api.nirvanahq.com/?api=rest' -d "method=auth.new&u=#{@username}&p=#{@password}"`
    parser = JSON.parse(result)
    parser['results'][0]['auth']['token'] || ''
  end

  def save_token! token
    raise "EmptyToken" if  token.nil? || token.empty?
    File.open(TOKEN_FILE, 'w').write(token)
    @token = token
  end

end