require 'rails_helper'

RSpec.describe Meal, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:time_schedule) }
    it { is_expected.to have_db_column(:description) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:diet) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:time_schedule) }
    it { is_expected.to validate_presence_of(:description) }
  end
end
