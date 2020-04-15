class DietsController < ApplicationController
  before_action :authenticate_user!

  layout "diet"

  def index
    @diets = Diet.where(user: current_user)
  end

  def new
    @diet = current_user.diets.new
    @diet.meals.build
  end

  def create
    @diet = Diet.new(diet_params)
    @diet.user = current_user
    binding.pry
    if @diet.save
      redirect_to(root_path)
    else
      render :new
    end
  end

  def show
    @diet = current_user.diets.new
    @diet.meals.new
  end

  private

  def diet_params
    params
      .require(:diet)
      .permit(:start_date,
        :end_date,
        :init_weight,
        :height,
        :ideal_weight,
        meals_attributes: %i[id meal_type description time_schedule _destroy]
      )
  end
end
