require 'rubygems'
require 'sinatra/base'

module App
  
  class Main < Sinatra::Base
    get '/' do
      'this / from class Main'
    end
  
    get '/hello' do
      'this is hello from class Main'
    end 
  end

  class Foo < Sinatra::Base
    get '/' do
      'this is / from class Foo mapped to /foo'
    end
  
    get '/hello' do
      'this is /hello from class Foo mapped to /foo'
    end
  end
  
  class Bar < Sinatra::Base
    get '/' do
      'this is / from class Bar mapped to /bar'
    end
    
    get '/hello' do
      'this is /hello from class Bar mapped to /bar'
    end
  end

end