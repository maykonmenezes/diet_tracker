class WeightPolicy
  attr_reader :user, :weight

  def initialize(user, weight)
    @user = user
    @weight = weight
  end

  def new?
    weight_belongs_to_user?
  end

  def create?
    weight_belongs_to_user?
  end

  private

  def weight_belongs_to_user?
    user == weight.user
  end
end
