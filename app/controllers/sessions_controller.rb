class SessionsController < ApplicationController
    def new 
    end

    def create 
        user= User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            render plain: "Correct!"
        
        else
            render plain: "Oh no Incorrect!"
    
        end
    end

end