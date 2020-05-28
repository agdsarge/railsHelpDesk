class TicketsController < ApplicationController
    before_action :check_login
    before_action :find_ticket, only: [:show, :edit, :update, :destroy]
    before_action :proper_client_access, only: [:show, :edit, :update, :destroy]
    def index
        @tickets = Ticket.all
    end

    def show
    end

    def new
        if session[:user_class] == 'Professional'
            redirect_to my_tickets_path(session[:logged_in_user_id])
        else
            @ticket = Ticket.new
            @ticket.comments.build
            @specialties = Professional.pluck(:specialty).uniq
        end
    end

    def create
        desc = ticket_params[:description]
        @ticket = Ticket.new(ticket_params)
        @ticket.client = Client.find(session[:logged_in_user_id])
        @ticket.professional = Professional.find_least_busy_pro(desc)

        if @ticket.valid?
            @ticket.open = true
            @ticket.save
            redirect_to ticket_path(@ticket)
        else
            render :new
        end
    end

    def edit
        # @ticket.comments.build
        @specialties = Professional.pluck(:specialty)
    end

    def update
        @ticket.update(ticket_params)
        if @ticket.valid?
            @ticket.save
            redirect_to ticket_path(@ticket)
        else
            render :edit
        end
    end

    def destroy
        @ticket.destroy
        redirect_to tickets_path(@ticket)
    end

    private


    def proper_client_access
        find_ticket
        unless session[:user_class] == 'Professional' || @ticket.client == Client.find(session[:logged_in_user_id])
            redirect_to client_welcome_path
        end
    end

    def ticket_params
        params.require(:ticket).permit(:description, :open, :client_id, :professional_id, comments_attributes: [:text, :ticket_id, :internal, :username])
    end

    def find_ticket
        @ticket = Ticket.find(params[:id])
    end
end
