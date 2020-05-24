class ProfessionalsController < ApplicationController
  before_action :find_isp, only: [:show, :edit, :update, :destroy]
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
      redirect_to professional_path(@professional)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @professional.update
    if @professional.valid?
      @professional.save
      redirect_to professional_path(@professional)
    else 
      render :edit
    end
  end

  def destroy
    @professional.destroy
    redirect_to professionals_path(@professional)
  end

  private

  def professional_params
    params.require(:professional).permit(:username, :specialty, :email)
  end

  def find_isp
    @professional = Professional.find(params[:id])
  end
end
