class FuneralsController < ApplicationController
  before_action :set_deceased
  before_action :set_funeral, only: [:show, :edit, :update, :destroy]

def index
  @title = 'Funerals'
  @funerals = @deceased.funerals
  flash[:info] = "This is Deceased's Funeral"
end

def show
  @title = @deceaced.funeral
end

def new
  @title = 'Add Funeral'
  @funeral = Funeral.new
end

def create
  @funeral = @deceased.funerals.new(funeral_params)
    if @funeral.save
      flash[:success] = 'New Funeral Created'
      redirect_to deceased_funeral_path(@deceased, @funeral)
    else
      flash[:error] = 'Please Try Again'
      render :new
    end
end

def edit
  @title = 'Edit Funeral'
end

def update
  if @funeral.update(funeral_params)
    flash[:success] = 'Funeral Updated'
    redirect_to deceased_funeral_path(@deceased, @funeral)
  else
    flash[:error] = 'Please Try Again'
    render :edit
  end
end

def destroy
  @funeral.destroy
  redirect_to deceased_funerals_path(@deceased)
end

private
  def funeral_params
    params.require(:funeral).permit(:location, :date, :time, :deceased_id)
  end

  def set_deceased
    @deceased = Deceased.find(params[:deceased_id])
  end

  def set_funeral
    @funeral = @deceased.funerals.find(params[:id])
  end
end
