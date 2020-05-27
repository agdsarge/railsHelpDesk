class ApplicationController < ActionController::Base

    helper_method :current_user
    helper_method :check_login

    def client_welcome
        @client_obj = Client.find(session[:logged_in_user_id])
        render :welcome
    end

    def current_user
        session[:username]
    end

    def check_login
        unless session.include? :username
            redirect_to '/login'
        end
    end
end
