require 'rails_helper'

RSpec.describe MealType, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:value) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:value) }
  end
end
