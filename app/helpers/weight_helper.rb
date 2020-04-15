module WeightHelper

  def self.weighting_dates(user)
    data = []
    user.weights.each do |weight|
      data << weight.created_at.to_formatted_s(:short)
    end
    data
  end

  def self.weights(user)
    data = user.weights.map(&:value)
  end
end
