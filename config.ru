# To use with thin
# thin start -p PORT -R config.ru
 
require 'sinatra'
 
require File.join(File.dirname(__FILE__), 'app.rb')
 
disable :run
 
set :environment, :development
 
map "/" do
  run App::Main
end
 
map "/foo" do
  run App::Foo
end

map "/bar" do
  run App::Bar
end
