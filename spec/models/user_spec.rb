require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:weights) }
    it { is_expected.to have_one(:diet) }
  end
end
