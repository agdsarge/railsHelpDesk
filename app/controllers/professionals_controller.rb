class ProfessionalsController < ApplicationController
    before_action :check_login
    before_action :find_professional, only: [:show, :edit, :update, :destroy, :my_tickets]
    before_action :maintain_privacy, only: [:show, :edit, :update, :destroy, :my_tickets, :index]
    def index
        @professionals = Professional.all
    end

    def show
    end

    def new
        @professional = Professional.new
    end

    def create
        @professional = Professional.new(professional_params)
        if @professional.valid?
            @professional.save
            redirect_to my_tickets_path(session[:logged_in_user_id])
        else
            render :new
        end
    end

    def edit

    end

    def update
        @professional.update(professional_params)
        if @professional.valid?
            @professional.save
            redirect_to my_tickets_path(session[:logged_in_user_id])
        else
            render :edit
        end
    end

    def destroy
        @professional.destroy
        redirect_to rm_user_path
    end

    def my_tickets
        @open_tickets = @professional.pro_open_tix
        @closed_tickets = @professional.pro_closed_tix
    end

    def remove_user
        @clients = Client.all
        @professionals = Professional.all
        render :remove_user
    end

    private

    def professional_params
        params.require(:professional).permit(:username, :specialty, :email, :name, :password)
    end

    def find_professional
        @professional = Professional.find(params[:id])
    end
end
