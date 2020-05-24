class IspsController < ApplicationController
  
  before_action :find_isp, only: [:show, :edit, :update, :destroy]
  def index
    @isps = Isp.all
  end

  def show
  end

  def new
    @isp = Isp.new
  end

  def create
    @isp = Isp.new(isp_params)
    if @isp.valid?
      @isp.save
      redirect_to isp_path(@isp)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @isp.update
    if @isp.valid?
      @isp.save
      redirect_to isp_path(@isp)
    else 
      render :edit
    end
  end

  def destroy
    @isp.destroy
    redirect_to isps_path(@isp)
  end

  private

  def isp_params
    params.require(:isp).permit(:name, :email)
  end

  def find_isp
    @isp = Isp.find(params[:id])
  end
end
