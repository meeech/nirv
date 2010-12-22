# The Command Line tool for NirvanaHQ
require "rubygems"
require "simpleconsole"

# @q how to deal with problems - ie: missing params? tried raise but having an issues
#   - the raise keeps bubbling up so need to play with those more to see what i'm doing wrong
# @todo How do you test a simpleconsole program? Ay advice would be appreciated tbd

class Controller < SimpleConsole::Controller

  attr_reader :nirvana

  params  :string => {
            :a => :name, 
            :t => :tags
          },
          :text => {:n => :note}

  BACKUP_FILE = "#{ENV['HOME']}/.nirvanahq/backup.json"

  def initialize
    super
    @my_app_name = 'nirv'
    @nirvana = NirvanaHQ.new $nirvana_config    
  end
  
  def default
    @message = "Hi. Try '#{@my_app_name} help' for a list of commands."
  end  

  def method_missing name = "method_missing"
    puts "Method #{name} does not exist. Try '#{@my_app_name} help'."
  end

  def add 
    # allow basic add action - nirv add "task name" without having 
    # to speicify the name explicitly
    params[:name] = params[:name]  || params[:id]

    if params[:name]
      
      #prepare payload
      # @q: anyone know better way to do this? still new to rb
      now = Time.now.to_i
      task = {}
      [:name, :tags, :note ].each do | key |
        begin 
          task[key] = params[key] 
          task["_#{key}"] = now 
        end if params[key]
      end

      #obviously, need to rethink this, and how we handle errors
      result = @nirvana.add task
      @message = "Added task: #{params[:name]}"
      
    else 
      @message = "Missing name of task, which is the bare minimum. Try '#{@my_app_name} help'."
    end
  end
  
  def backup
    result = @nirvana.everything
    # seems silly that we will go back to JSON format, but thats how I want to store the blobs, 
    # but I want nirvanahq lib to pass back hashes
    if File.open(BACKUP_FILE, 'w').write(result.to_json)
      @message = "Your account data has been downloaded and saved to #{BACKUP_FILE}"
    end
  rescue Exception => e:
    @message = "There was a problem: #{e.to_s}"
  end
  
  def trash
    
  end
  
  def version
    # Issue: Was getting fatal .git errors in built version.
    # Okay! Totally boneheaded, but basically, if you using things 
    # like `git` in your gemspec, then you can't access the file
    # dynamically. I assumed its making a copy of the parsed gemspec., which I could access this info. 
    # was lifted from from UUID gem. 
    # version = Gem::Specification.load(File.expand_path("../nirvanahq.gemspec", File.dirname(__FILE__))).version.to_s.split(".").map { |i| i.to_i }
    # @todo move to VERSION txt file
    @message = @my_app_name << " - " << NirvanaHQ::VERSION
  end
  
end

class View < SimpleConsole::View

  def add
    puts @message    
  end

  def backup
    puts @message
  end

  def version
    puts @message
  end

  def default
    puts @message    
  end
  
end

