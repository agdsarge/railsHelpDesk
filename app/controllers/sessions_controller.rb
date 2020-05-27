class SessionsController < ApplicationController

    def new
    end

    def create
        if params[:username].nil? || params[:username].empty?
            redirect_to '/'
        else
            session[:username] = params[:username]
            redirect_to '/welcome'
        end
    end

    def destroy
        session.delete :name
    end

end
