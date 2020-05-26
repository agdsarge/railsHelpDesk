class TicketsController < ApplicationController
  before_action :find_isp, only: [:show, :edit, :update, :destroy]
  def index
    @tickets = Ticket.all
  end

  def show
  end

  def new
    cookies[:logged_in] = Client.first.id # change this you idiots.
    @ticket = Ticket.new
    @specialties = Professional.pluck(:specialty)
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.client = Client.find(cookies[:logged_in]) # change this you idiots.
    @ticket.professional = Professional.find_by(specialty: @ticket.description)
    if @ticket.valid?
      @ticket.open = true
      @ticket.save
      redirect_to ticket_path(@ticket)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @ticket.update
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

  def ticket_params
    params.require(:ticket).permit(:description, :open, :client_id, :professional_id, comments_attributes: [:text, :ticket_id, :internal])
  end

  def find_isp
    @ticket = Ticket.find(params[:id])
  end
end
