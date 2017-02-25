class DeceasedsController < ApplicationController
  before_action :set_mortuary
  before_action :set_deceased, only: [:show, :edit, :update, :destroy]

def index
  @body_class = 'deceased-img'
  @title = 'Deceased'
  @deceaseds = @mortuary.deceaseds.paginate(page: params[:page], per_page: 6)
  flash[:info] = "These are the Deceased"
end

def show
  @body_class = 'deceased-img'
  @title = @deceased.funeral
end

def new
  @body_class = 'deceased-img'
  @title = 'Add New Deceased'
  @deceased = Deceased.new
end

def create
  @deceased = @mortuary.deceaseds.new(deceased_params)
    if @deceased.save
      flash[:success] = 'New Deceased Created'
      redirect_to mortuary_deceased_path(@mortuary, @deceased)
    else
      flash[:error] = 'Please Try Again'
      render :new
    end
end

def edit
  @body_class = 'deceased-img'
  @title = 'Edit This Person'
end

def update
  if @deceased.update(deceased_params)
    flash[:success] = 'Deceased Updated'
    redirect_to mortuary_deceased_path(@mortuary, @deceased)
  else
    flash[:error] = 'Please Try Again'
    render :edit
  end
end

def destroy
  @deceased.destroy
  redirect_to mortuary_deceaseds_path(@mortuary)
end

private
  def deceased_params
    params.require(:deceased).permit(:first_name, :last_name, :birthdate, :deathdate, :cod, :mortruay_id)
  end

  def set_mortuary
    @mortuary = Mortuary.find(params[:mortuary_id])
  end

  def set_deceased
    @deceased = @mortuary.deceaseds.find(params[:id])
  end
end
