class ApplicationController < ActionController::Base
    
    helper_method :current_user
    helper_method :check_login

    def welcome
        render :welcome
    end

    def current_user
        sessions[:username]
    end

    def check_login
        unless session.include? :username
            redirect_to '/login'
        end
    end
end
