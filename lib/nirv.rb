# The Command Line tool for NirvanaHQ
require "rubygems"
require "simpleconsole"
require "uuid"

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
      now = Time.now.to_i

      #set some sane defaults.
      task = {
        "method" => "task.save",
        "id" => UUID.generate,
        "type" => 0,
        "_type" => now,
        "state" => 0,
        "_state" => now,
      }
      
      #@commentplz: anyone know better way to do this? still new to rb
      [:name, :tags, :note ].each do | tag |
        begin 
          task[tag] = params[tag] 
          task["_#{tag}"] = now 
        end if params[tag]
      end

      #obviously, need to rethink this, and how we handle errors
      result = @nirvana.add task
      @message = "Added task: #{params[:name]}"
      
    else 
      @message = "Missing name of task, which is the bare minimum. Try '#{@my_app_name} help'."
    end
  end
  
  #totally lifted from UUID gem. 
  def version
    version = Gem::Specification.load(File.expand_path("../nirvanahq.gemspec", File.dirname(__FILE__))).version.to_s.split(".").map { |i| i.to_i }
    major = version[0]
    minor = version[1]
    patch = version[2]
    @message = @my_app_name << " - " << "#{major}.#{minor}.#{patch}"
  end
  
end

class View < SimpleConsole::View

  def add
    puts @message    
  end

  def version
    puts @message
  end

  def default
    puts @message    
  end
  
end

