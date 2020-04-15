class DietsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_diet, only: %i[edit update destroy]

  layout "diet"

  def index
    @diets = Diet.where(user: current_user)
  end

  def new
    @diet = Diet.new
    @diet.meals.build
    @meal_types = MealType.all
  end

  def create
    @diet = Diet.new(diet_params)
    @diet.user = current_user
    binding.pry
    if @diet.save
      flash[:notice] = "Diet saved successfully."
      redirect_to(root_path)
    else
      render :new
    end
  end

  def show
    @diet = current_user.diet
    # authorize @game
  end

  def edit
    @meal_types = MealType.all
  end

  def update
    # authorize @word
    @diet.assign_attributes(diet_params)
    set_user_for_translations(@word)
    if @diet.save
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
end
