class ClientsController < ApplicationController
    before_action :check_login
    before_action :maintain_privacy, only: [:show, :edit, :update, :destroy]
    before_action :find_client, only: [:show, :edit, :update, :destroy]

    def index
        @clients = Client.all
    end

    def show
        @open_tickets = Ticket.all.select {|t| t.client == @client && t.open}
        @closed_tickets = Ticket.all.select {|t| t.client == @client && !t.open}
    end

    def new
        @client = Client.new
    end

    def create
        @client = Client.new(client_params)
        if @client.valid?
            @client.save
            redirect_to client_path(@client)
        else
            render :new
        end
    end

    def edit

    end

    def update
        @client.update(client_params)
        if @client.valid?
            @client.save
            redirect_to client_path(@client)
        else
            render :edit
        end
    end

    def destroy
        @client.destroy
        redirect_to clients_path(@client)
    end

    private

    def client_params
        params.require(:client).permit(:name, :phone_number, :email, :home_address, :isp_id)
    end

    def maintain_privacy
        unless session[:user_class] == 'Professional' || session[:logged_in_user_id].to_s == params[:id]
            redirect_to client_welcome_path
        end
    end

    def find_client
        @client = Client.find(params[:id])
    end
end
