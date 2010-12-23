require 'rubygems'
require 'json'

begin
  require "#{ENV['HOME']}/.nirvanahq/config.rb"
rescue LoadError => e
end

require 'nirvanahq/auth'
require 'nirvanahq/task'

class NirvanaHQ
  VERSION = '0.0.3'
end