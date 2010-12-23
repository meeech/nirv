require 'test/unit'
require 'rubygems'
require 'redgreen' if ENV['TM_FILENAME'].nil?
# require 'mocha'
require 'yaml'

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
