require 'rails_helper'

RSpec.describe Weight, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:value) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:value) }
  end
end
