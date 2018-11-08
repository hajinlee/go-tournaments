FactoryBot.define do

  factory :user do
    first_name "hello"
    last_name "world"
    sequence(:email) { |n| "test#{n}@examples.org" }
    password "lalalala"
    password_confirmation { password }
  end
end
