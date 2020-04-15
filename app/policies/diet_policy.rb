class DietPolicy
  attr_reader :user, :diet

  def initialize(user, diet)
    @user = user
    @diet = diet
  end

  def access?
    diet_belongs_to_user?
  end

  def new?
    diet_belongs_to_user?
  end

  def create?
    diet_belongs_to_user?
  end

  def show?
    diet_belongs_to_user?
  end

  def edit?
    diet_belongs_to_user?
  end

  def update?
    diet_belongs_to_user?
  end

  private

  def diet_belongs_to_user?
    user == diet.user
  end
end
