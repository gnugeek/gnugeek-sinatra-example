# To use with thin
# thin start -p PORT -R config.ru
 
require 'sinatra'
 
require File.join(File.dirname(__FILE__), 'app.rb')
 
disable :logging
 
set :environment, :development

rack = proc do |env|
  [200, { 'Content-Type' => 'text/html' }, "#{env['rack.session'].inspect}"]
end


map "/" do
  run App::Main
end
 
map "/foo" do
  run App::Foo
end

map "/bar" do
  run App::Bar
end

map "/rack" do
 use Rack::Session::Cookie
 run rack
end
