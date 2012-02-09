FactoryGirl.define do
  factory :user do
    first_name 'Josh'
    last_name 'Turnipseed'
    email 'josh@isotope11.com'
    password 'isotope'
    password_confirmation 'isotope'
  end

  factory :post do
    association :user
    title 'This post'
    body 'Some text'
  end
end
