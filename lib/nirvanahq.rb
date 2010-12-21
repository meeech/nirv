require 'rubygems'
require 'json'

require "#{ENV['HOME']}/.nirvanahq/config.rb"

require 'nirvanahq/auth'
require 'nirvanahq/task'

class NirvanaHQ
  VERSION = '0.0.3'
end