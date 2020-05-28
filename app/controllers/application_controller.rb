class ApplicationController < ActionController::Base

    helper_method :current_user
    helper_method :check_login
    helper_method :maintain_privacy
    before_action :check_login, only: [:client_welcome, :retry]


    def client_welcome
        client = Client.find_by(id: session[:logged_in_user_id])
        pro = Professional.find_by(id: session[:logged_in_user_id])
        client ? (@user = client) : (@user = pro)
        render :welcome
    end

    def retry
        
        client = Client.find_by(id: session[:logged_in_user_id])
        pro = Professional.find_by(id: session[:logged_in_user_id])
        client ? (@user = client) : (@user = pro)
        render :error_page
    end

    def current_user
        session[:username]
    end

    def check_login
        unless session.include? :username
            redirect_to '/login'
        end
    end

    def maintain_privacy
        unless session[:user_class] == 'Professional' || session[:logged_in_user_id].to_s == params[:id]
            redirect_to client_welcome_path
        end
    end
end
