class WeightsController < ApplicationController
  before_action :authenticate_user!

  layout "diet"

  def new
    @weight = Weight.new
  end

  def create
    @weight = Weight.new(weight_params)
    @weight.user = current_user
    if @weight.save
      flash[:notice] = "Weight saved successfully."
      redirect_to(root_path)
    else
      render :new
    end
  end

  private

  def weight_params
    params.require(:weight).permit(:value)
  end
end
