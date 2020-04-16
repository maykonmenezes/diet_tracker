class WeightPolicy
  attr_reader :user, :weight

  def initialize(user, weight)
    @user = user
    @weight = weight
  end

  def access?
    weight_belongs_to_user?
  end

  private

  def weight_belongs_to_user?
    user == weight.user
  end
end
