require 'test/unit'
require 'rubygems'
require 'mocha'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'nirvanahq'

def task_json
  File.open("examples/task.json", 'r').read
end

def boom_json(name)
  Boom::Storage.any_instance.stubs(:json_file).
    returns("test/examples/#{name}.json")
  Boom.stubs(:storage).returns(Boom::Storage.new)
end
