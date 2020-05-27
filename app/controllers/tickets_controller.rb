class TicketsController < ApplicationController
    before_action :check_login
    before_action :find_ticket, only: [:show, :edit, :update, :destroy, :toggle_open_status]
    def index
        @tickets = Ticket.all
    end

    def show
        
    end

    def new
        session[:logged_in] = Client.first.id # change this you idiots.
        @ticket = Ticket.new
        @ticket.comments.build
        @specialties = Professional.pluck(:specialty).uniq
    end

    def create
        desc = ticket_params[:description]
        @ticket = Ticket.new(ticket_params)
        @ticket.client = Client.find(session[:logged_in]) # change this you idiots.

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

    def toggle_open_status

    end

    def destroy
        @ticket.destroy
        redirect_to tickets_path(@ticket)
    end

    private

    def ticket_params
        params.require(:ticket).permit(:description, :open, :client_id, :professional_id, comments_attributes: [:text, :ticket_id, :internal])
    end

    def find_ticket
        @ticket = Ticket.find(params[:id])
    end
end
