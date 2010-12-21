class NirvanaHQ

  # task a hash with the task info
  def add task

    payload = [task].to_json
    result = `curl -sX POST 'https://api.nirvanahq.com/?api=json&authtoken=#{@token}' -d '#{payload}'`

  end

end