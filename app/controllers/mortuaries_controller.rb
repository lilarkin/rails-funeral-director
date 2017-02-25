class MortuariesController < ApplicationController
  before_action :set_mortuary, only: [:show, :edit, :update, :destroy]
  def index
    @title = 'Mortuaries'
    @mortuaries = current_user.mortuaries.paginate(page: params[:page], per_page: 5)
    flash[:info] = 'Welcome to Mortuaries'
  end

  def show
    @title = @mortuary.name
  end

  def new
    @title = 'Add Mortuary'
    @mortuary = Mortuary.new
  end

  def create
    @mortuary = current_user.mortuaries.new(mortuary_params)
    if @mortuary.save
      flash[:success] = 'Mortuary Created'
      redirect_to mortuary_path(@mortuary)
    else
      flash[:error] = 'Try again'
      render :new
    end
  end

  def edit
    @title = 'Edit Mortuary'
  end

  def update
    if @mortuary.update(mortuary_params)
      flash[:success] = 'Morturary updated'
      redirect_to mortuary_path(@mortuary)
    else
      flash[:error] = 'Try again'
      render :edit
    end
  end

  def destroy
    @mortury.destroy(mortuary_params)
    flash[:success] = 'Mortuary Deleted'
    redirect_to mortuaries_path
  end

  private
    def set_mortuary
      @mortuary = Mortuary.find(params[:id])
    end

    def mortuary_params
      params.require(:mortuary).permit(:name, :city, :state)
    end

end
