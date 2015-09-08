FactoryGirl.define do
  factory :comment do
    body { Faker::Lorem.sentence(2) }
    association :owner, factory: :user
  end
end