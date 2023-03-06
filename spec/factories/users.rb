FactoryBot.define do
  factory :user do
    email { "#{Faker::Alphanumeric.alpha(number: [8, 10].sample)}@gmail.com" }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
