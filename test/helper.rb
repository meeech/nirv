require 'test/unit'
require 'rubygems'
require 'redgreen' if ENV['TM_FILENAME'].nil?
require 'mocha'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'nirvanahq'

#Refresh the Gemfile.lock
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

# Simple stub to get a json version of a task payload
def task_json
  File.open(File.dirname(__FILE__) + "/examples/task.json", 'r').read
end

def boom_json(name)
  Boom::Storage.any_instance.stubs(:json_file).
    returns("test/examples/#{name}.json")
  Boom.stubs(:storage).returns(Boom::Storage.new)
end
