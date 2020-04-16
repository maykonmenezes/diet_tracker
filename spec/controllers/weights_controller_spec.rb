require 'rails_helper'

RSpec.describe WeightsController do
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

      it 'assigns @weight' do
        expect(assigns(:weight)).to be_a_new(Weight)
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end

      it do
        expect(response).to have_http_status(200)
      end
    end

    context 'when user is NOT signed in' do
      it 'assigns @weight' do
        expect(assigns(:weight)).to eq(nil)
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
    context 'when user is signed in' do
      let(:user) { create(:user) }

      before { sign_in(user) }

      context 'valid params' do
        subject { post :create, params: { weight: { value: 89} } }

        it 'creates a new weight for the current user' do
          expect { subject }.to change(Weight, :count).from(0).to(1)
          expect(user).to eq(Weight.last.user)
        end

        it do
          subject
          expect(response).to have_http_status(302)
        end
      end

      context 'invalid params' do
        subject { post :create, params: { weight: { value: ''} } }

        it 'does not create new diet' do
          expect { subject }.not_to change(Weight, :count)
        end

        it do
          subject
          expect(response).to have_http_status(200)
        end
      end
    end

    context 'when user is NOT signed in' do
      subject { post :create, params: { weight: { value: 89} } }
      
      it 'does not redirect to a new weight' do
        expect(subject).not_to redirect_to(Weight.last)
      end

      it do
        subject
        expect(response).to have_http_status(302)
      end
    end
  end
end
