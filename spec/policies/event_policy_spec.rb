require 'rails_helper'

RSpec.describe EventPolicy, type: :policy do
  subject { described_class }

  let(:factory_user) { FactoryBot.create(:user) }
  let(:factory_another_user) { FactoryBot.create(:user) }

  let(:user) { UserContext.new({ user: factory_user, pincode: '', cookies: {}}) }
  let(:another_user) { UserContext.new({ user: factory_another_user, pincode: '', cookies: {}}) }
  let(:another_user_know_pincode) { UserContext.new({ user: factory_another_user, pincode: '123', cookies: {}}) }
  let(:anonymous) { UserContext.new({ user: nil, pincode: '', cookies: {}}) }
  let(:anonymous_know_pincode) { UserContext.new({ user: nil, pincode: '123', cookies: {}}) }

  let(:event) { FactoryBot.create(:event, user: factory_user) }
  let(:event_with_pincode) { FactoryBot.create(:event, user: factory_user, pincode: '123') }

  permissions :edit?, :update?, :destroy? do
    context 'when user is event author' do
      it 'changes event' do
        expect(subject).to permit(user, event)
      end
    end

    context 'when user is not event author' do
      it 'not changes event' do
        expect(subject).not_to permit(another_user, event)
      end
    end

    context 'when user is anonymous' do
      it 'not changes event' do
        expect(subject).not_to permit(anonymous, event)
      end
    end
  end

  permissions :show? do
    context 'when user is event author' do
      context 'and event has pincode' do
        it 'shows event' do
          expect(subject).to permit(user, event_with_pincode)
        end
      end

      context 'and event has not pincode' do
        it 'shows event' do
          expect(subject).to permit(user, event)
        end
      end
    end

    context 'when user is not event author' do
      context 'and event has pincode' do
        it 'not shows event' do
          expect(subject).to_not permit(another_user, event_with_pincode)
        end

        it 'shows event if user know pincode' do
          expect(subject).to permit(another_user_know_pincode, event_with_pincode)
        end
      end

      context 'and event has not pincode' do
        it 'shows event' do
          expect(subject).to permit(another_user, event)
        end
      end
    end

    context 'when user is anonymous' do
      context 'and event has pincode' do
        it 'not shows event' do
          expect(subject).to_not permit(anonymous, event_with_pincode)
        end

        it 'shows event if user know pincode' do
          expect(subject).to permit(anonymous_know_pincode, event_with_pincode)
        end
      end

      context 'and event has not pincode' do
        it 'shows event' do
          expect(subject).to permit(anonymous, event)
        end
      end
    end
  end
end
