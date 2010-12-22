require 'uuid'

class NirvanaHQ

  def post payload
    result = `curl -sX POST 'https://api.nirvanahq.com/?api=json&authtoken=#{@token}' -d '#{payload}'`  
  end

  # task_details a hash with the task info  
  def add task_details

    #prepare payload
    now = Time.now.to_i    
    defaults = {
      "method" => "task.save",
      "id" => UUID.generate,
      "type" => 0,
      "_type" => now,
      "state" => 0,
      "_state" => now,
    }

    task = defaults.merge(task_details)
    self.post [task].to_json
  end


  def trash task_id

    task = {
      "method" => "task.save",
      "id" => task_id,
      "state" => 6,
      "_state" => Time.now.to_i
    }

    self.post [task].to_json
  end

end