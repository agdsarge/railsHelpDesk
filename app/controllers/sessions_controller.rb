class SessionsController < ApplicationController

    def new
    end

    def create
        username = params[:username]
        password = params[:password]
        client_to_login = Client.find_by(username: username)
        pro_to_login = Professional.find_by(username: username)

        if client_to_login && client_to_login.authenticate(password)
            session[:username] = username
            session[:logged_in_user_id] = client_to_login.id
            session[:user_class] = "Client"
            redirect_to '/client_welcome'

        elsif pro_to_login && pro_to_login.authenticate(password)
            session[:username] = username
            session[:logged_in_user_id] = pro_to_login.id
            session[:user_class] = "Professional"
            redirect_to my_tickets_path(session[:logged_in_user_id])
            
        else
            flash[:error_message] = "This combination of username and password is invalid."
            redirect_to '/'
        end
    end


    def destroy
        session.delete :username
        session.delete :logged_in_user_id
        session.delete :user_class
        redirect_to '/'
    end

end
