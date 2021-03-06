class DietsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_diet, only: %i[edit update]
  before_action :access?, only: %i[edit update]

  layout "diet"

  def new
    @diet = Diet.new
    @diet.meals.build
    @meal_types = MealType.all
  end

  def create
    @diet = Diet.new(diet_params)
    @diet.user = current_user
    if @diet.save
      set_weight(@diet.init_weight)
      flash[:notice] = "Diet saved successfully."
      redirect_to(root_path)
    else
      render :new
    end
  end

  def show
    @diet = current_user.diet
  end

  def edit
    @meal_types = MealType.all
  end

  def update
    @diet.assign_attributes(diet_params)
    if @diet.save
      set_weight(@diet.init_weight)
      redirect_to(diet_path(@diet))
    else
      render :edit
    end
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
        meals_attributes: %i[id meal_type_id description time_schedule _destroy]
      )
  end

  def set_diet
    @diet = Diet.find(params[:id])
  end

  def set_weight(value)
    weight = Weight.new(value: value, user: current_user)
    weight.save
  end

  def access?
    authorize @diet
  end
end
