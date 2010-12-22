class NirvanaHQ

  # task a hash with the task info
  
  def post payload
    result = `curl -sX POST 'https://api.nirvanahq.com/?api=json&authtoken=#{@token}' -d '#{payload}'`  
  end
  
  def add task
    self.post [task].to_json
  end


  def trash task_id
   return false
  end

end