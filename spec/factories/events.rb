FactoryBot.define do
  factory :event do
    association :user

    title { 'Some event' }
    address { 'Krasnoyarsk' }
    datetime { Time.now }
  end
end
