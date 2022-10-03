require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.from_omniauth' do
    let(:access_token) do
      double(
        :access_token,
        provider: 'google_oauth2',
        info: double(
          email: 'user@gmail.com',
          image: 'https://lh3.googleusercontent.com/ogw/AOh-ky2K3jolrvtdJjLQliTlGDWMwcyhpNfBtqbfEySd=s32-c-mo'
          ),
        uid: '1854078346'
      )
    end

    context 'when user is not found' do
      let(:user) { User.from_omniauth(access_token) }

      it 'creates new user' do
        expect(user).to be
      end

      it 'user persists' do
        expect(user).to be_persisted
      end

      it 'user has email' do
        expect(user.email).to eq('user@gmail.com')
      end
    end

    context 'when user is found by email' do
      let!(:existing_user) { FactoryBot.create(:user, email: 'user@gmail.com') }
      let!(:some_other_user) { FactoryBot.create(:user) }

      it 'returns this user' do
        expect(User.from_omniauth(access_token)).to eq(existing_user)
      end
    end

    context 'when user is found by provide & uid' do
      let!(:existing_user) { FactoryBot.create(:user, provider: 'google_oauth2', uid: '1854078346') }
      let!(:some_other_user) { FactoryBot.create(:user) }

      it 'returns this user' do
        expect(User.from_omniauth(access_token)).to eq(existing_user)
      end
    end
  end
end
