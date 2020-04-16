require 'rails_helper'

RSpec.describe DietsController do
  describe 'GET new' do
    before do
      get :new
    end

    context 'when user is signed in' do
      let(:user) { create(:user) }

      before do
        sign_in(user)
        get :new
      end

      it 'assigns @diet' do
        expect(assigns(:diet)).to be_a_new(Diet)
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end

      it do
        expect(response).to have_http_status(200)
      end
    end

    context 'when user is NOT signed in' do
      it 'assigns @diet' do
        expect(assigns(:diet)).to eq(nil)
      end

      it 'does not renders the new template' do
        expect(response).not_to render_template(:new)
      end

      it do
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'POST create' do
    subject { post :create, params: params }

    context 'when user is signed in' do
      let(:user) { create(:user) }

      before { sign_in(user) }

      context 'valid params' do
        let!(:start_date) { DateTime.new }
        let!(:start_end) { DateTime.new }
        let(:params) do
          { diet: { init_weight: 89, ideal_weight: 76, height: 89,
            start_date: start_date, end_date: end_date } }
        end

        it 'creates a new diet' do
          expect { subject }.to change(Diet, :count).from(0).to(1)
        end

        it do
          subject
          expect(response).to have_http_status(302)
        end

        context 'when some meal is present' do
          let!(:meal) { create(:meal) }
          let(:params) do
            { diet:
              {
                init_weight: 78,
                ideal_weight: 87,
                start_date: start_date,
                end_date: end_date,
                height: 78,
                meals_attributes:
                  {
                    '1541932687026' =>
                    {
                      time_schedule: DateTime.new,
                      meal_type_id: 1,
                      description: 'description',
                      _destroy: false
                    }
                  }
              }
            }
          end

          it 'creates a new diet' do
            expect { subject }.to change(Diet, :count).from(0).to(1)
          end

          it 'creates a meal for last diet' do
            subject
            expect(Meal.first.reload.translations.count).to eq(1)
          end
        end
      end

      context 'invalid params' do
        let(:params) do
          { diet: { init_weight: '' } }
        end

        it 'does not create new diet' do
          expect { subject }.not_to change(Diet, :count)
        end

        it do
          subject
          expect(response).to have_http_status(200)
        end
      end
    end

    context 'when user is NOT signed in' do
      context 'valid params' do
        let!(:start_date) { DateTime.new }
        let!(:end_date) { DateTime.new }
        let(:params) do
          { diet: { init_weight: 89, ideal_weight: 76, height: 89,
            start_date: start_date, end_date: end_date } }
        end

        it 'does not create a new diet' do
          expect { subject }.not_to change(Diet, :count)
        end

        it do
          subject
          expect(response).to have_http_status(302)
        end
      end

      context 'invalid params' do
        let(:params) do
          { diet: { init_weight: '' } }
        end

        it 'does not create new diet' do
          expect { subject }.not_to change(Diet, :count)
        end

        it do
          subject
          expect(response).to have_http_status(302)
        end
      end
    end
  end

  describe 'GET show' do
    before { get :show, params: params }

    let(:params) do
      { id: diet.id }
    end
    let!(:diet) { create(:diet) }

    it 'assigns @diet' do
      expect(assigns(:diet)).to eq(diet)
    end

    it 'renders the new template' do
      expect(response).to render_template(:show)
    end
  end

  describe 'GET edit' do
    subject { get :edit, params: params }

    context 'when user is signed in' do
      let(:user) { create(:user) }
      let(:params) { { id: diet.id } }
      let!(:diet) { create(:diet, user: user) }

      before do
        sign_in(user)
        subject
      end

      it 'assigns @diet' do
        expect(assigns(:diet)).to eq(diet)
      end

      it 'renders the edit template' do
        expect(response).to render_template(:edit)
      end

      it do
        subject
        expect(response).to have_http_status(200)
      end
    end

    context 'when user is NOT signed in' do
      let(:params) { { id: diet.id } }
      let!(:diet) { create(:diet) }

      it 'does not assigns @diet' do
        expect(assigns(:diet)).to eq(nil)
      end

      it 'does not renders the edit template' do
        expect(response).not_to render_template(:edit)
      end

      it do
        subject
        expect(response).to have_http_status(302)
      end
    end
  end
end
