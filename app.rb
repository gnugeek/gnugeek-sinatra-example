require 'rubygems'
require 'rack'
require 'sinatra/base'

module App
  
  class Main < Sinatra::Base
    disable :logging
    
    get '/' do
      'this / from class Main'
    end
  
    get '/hello' do
      'this is hello from class Main'
    end 
  end

  class Foo < Sinatra::Base
    
    # only requests to /foo/* will log, as we have
    # disabled logging in the config.ru, and 
    # each sinatra base class can have it's own
    # middleware stack.  one problem: the request
    # uris logged are relative to where this class
    # is mounted in the config.ru, so requests to
    # /foo/hello get logged as:
    # 127.0.0.1 - - [21/Jan/2009 06:20:14] "GET /hello HTTP/1.1" 200 44 0.0004
    
    
    use Rack::CommonLogger
    
    get '' do
      'this is / from class Foo mapped to /foo'
    end
  
    get '/hello' do
      'this is /hello from class Foo mapped to /foo'
    end
  end
  
  class Bar < Sinatra::Base
    disable :logging
        
    get '' do
      'this is / from class Bar mapped to /bar'
    end
    
    get '/hello' do
      'this is /hello from class Bar mapped to /bar'
    end
  end

end