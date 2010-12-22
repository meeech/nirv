require 'uuid'

class NirvanaHQ

  def post payload
    result = `curl -sX POST 'https://api.nirvanahq.com/?api=json&authtoken=#{@token}' -d '#{payload}'`  
  end

  def everything
    url = "https://api.nirvanahq.com/?requestid=#{UUID::generate}&clienttime=#{Time.now.to_i}&api=rest&authtoken=#{@token}&method=everything&since=0"
    p url
    result = `curl -sX GET '#{url}'`
    p result
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

  def delete task_id

    task = {
      "method" => "task.save",
      "id" => task_id,
      "deleted" => Time.now.to_i,
      "_deleted" => Time.now.to_i
    }

    self.post [task].to_json
  end

  def undelete task_id

    task = {
      "method" => "task.save",
      "id" => task_id,
      "deleted" => 0,
      "_deleted" => Time.now.to_i
    }

    self.post [task].to_json
  end


end