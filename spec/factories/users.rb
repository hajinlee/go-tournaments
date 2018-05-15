FactoryBot.define do

  sequence(:random_email) {|n| "test#{n}@example.com" }

  factory :user do
    first_name "hello"
    last_name "world"
    email { generate(:random_email) }
    password "lalalala"
    password_confirmation { password }

  end
end
