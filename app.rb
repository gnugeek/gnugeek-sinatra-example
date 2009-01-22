require 'rubygems'
require 'rack'
require 'sinatra/base'

module App
  
  class Main < Sinatra::Base
    
    # enabling rack sessions for Main
    enable :static, :sessions

    # puts something in the session to play with.
    # it will be visible from any other app
    # on this server using rack sessions.
    get '/' do
      session[:Main] = "set from Main"
      'this / from class Main'
    end
  
    get '/hello' do
      'this is hello from class Main'
    end 

    # see what's in the rack session
    get '/session' do
      "#{session.inspect}"
    end

  end

  class Foo < Sinatra::Base
    
    # enabling rack sessions for Foo
    enable :static, :sessions

    # use Rack::Auth::Basic, and set the user
    # and password to foo -only- for this servlet.
    use Rack::Auth::Basic do |username, password|
      username == 'foo' && password == 'foo'
    end
    
    # puts something in the session to play with.
    # it will be visible from any other app
    # on this server using rack sessions.
    get '' do
      session[:Foo] = "set from Foo"
      'this is / from class Foo mapped to /foo'
    end
  
    get '/hello' do
      'this is /hello from class Foo mapped to /foo'
    end

    # see what's in the rack session
    get '/session' do
      "#{session.inspect}"
    end
  end
  
  class Bar < Sinatra::Base
   
    # use Rack::Auth::Basic, and set the user
    # and password to bar -only- for this servlet.
    use Rack::Auth::Basic do |username, password|
      username == 'bar' && password == 'bar'
    end
        
    get '' do
      'this is / from class Bar mapped to /bar'
    end
    
    get '/hello' do
      'this is /hello from class Bar mapped to /bar'
    end

    # things set in the session by Main and Foo
    # will not show up here! we are not using
    # rack sessions in Bar.
    get '/session' do
      "#{session.inspect}"
    end
  end

end
