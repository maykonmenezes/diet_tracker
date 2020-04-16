require 'rails_helper'

RSpec.describe Diet, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:start_date) }
    it { is_expected.to have_db_column(:end_date) }
    it { is_expected.to have_db_column(:init_weight) }
    it { is_expected.to have_db_column(:ideal_weight) }
    it { is_expected.to have_db_column(:height) }
  end

  describe 'nested attributes' do
    it do
       is_expected
       .to accept_nested_attributes_for(:meals)
       .allow_destroy(true)
     end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }

    it do
      is_expected.to have_many(:meals)
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:end_date) }
    it { is_expected.to validate_presence_of(:init_weight) }
    it { is_expected.to validate_presence_of(:ideal_weight) }
    it { is_expected.to validate_presence_of(:height) }

    it do
      validate_numericality_of(:init_weight).
           is_greater_than(0)
    end

    it do
      validate_numericality_of(:ideal_weight).
           is_greater_than(0)
    end

    it do
      validate_numericality_of(:height).
           is_greater_than(0)
    end
  end
end
