FactoryBot.define do
  factory :user do
    last_name             {"スパイシー"}
    first_name            {"デリシャス"}
    email                 {Faker::Internet.free_email}
    password              {"curry123"}
    password_confirmation {password}
    nickname              {Faker::Lorem.characters(number: 10)}
    date_of_birth         {"1990-12-12"}
  end
end
