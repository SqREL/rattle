FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.sentence }
    url   { Faker::Internet.url }
    association :owner, factory: :user
  end
end