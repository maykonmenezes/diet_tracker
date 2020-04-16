require 'rails_helper'

RSpec.describe WeightHelper, type: :helper do
  describe '#weighting_dates' do
    context 'when some weights are present' do
      let(:user) { create(:user) }
      let!(:weight) { create(:weight, user: user) }

      it 'returns the weighting_dates' do
        expect(WeightHelper::weighting_dates(user)).to eq([weight.created_at.to_formatted_s(:short)])
      end
    end

    context 'does no return any dates' do
      let(:user) { create(:user) }
      it 'assigns @dates' do
        expect(WeightHelper::weighting_dates(user)).to eq([])
      end
    end
  end

  describe '#weights' do
    context 'when some weights are present' do
      let(:user) { create(:user) }
      let!(:weight) { create(:weight, user: user) }

      it 'returns the weighting_dates' do
        expect(WeightHelper::weights(user)).to eq([weight.value])
      end
    end

    context 'does no return any dates' do
      let(:user) { create(:user) }
      it 'assigns @dates' do
        expect(WeightHelper::weights(user)).to eq([])
      end
    end
  end
end
