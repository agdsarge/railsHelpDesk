class TicketsController < ApplicationController
  before_action :find_isp, only: [:show, :edit, :update, :destroy]
  def index
    @tickets = Ticket.all
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.valid?
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
    params.require(:ticket).permit(:description, :open, :client_id, :professional_id)
  end

  def find_isp
    @ticket = Ticket.find(params[:id])
  end
end
