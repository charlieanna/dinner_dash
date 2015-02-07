FactoryGirl.define do
  factory :item do
    title 'Milk'
    description 'Slim Milk'
    price 10.0
    category
  end

  factory :category do
    title 'Kitchen'
  end

  factory :user do
  	email "person@example.com"
  	password "aaaaaa"
  	name "ankur"
  end
end