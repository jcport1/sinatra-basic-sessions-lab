require_relative 'config/environment'

class App < Sinatra::Base

    configure do
        enable :sessions
        set :session_secret, "secret"
    end 

    get '/' do

        erb :index 
    end 

    post '/checkout' do

        session["item"] = params[:item] #add the argument passed into params as a key-value pair in session 
        @session = session #save session - this is the sessions hash 
        #*b/c we enabled sessions in our app, every controller action has access to the sessions hash
        erb :display_item #render added item via erb file 
      
    end

end