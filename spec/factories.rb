FactoryGirl.define do
  factory :cart do
  end

  factory :line_item do
    item
    cart
  end

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
    sequence :email do |n|
      "person#{n}@example.com"
    end
  	password "aaaaaa"
  	name "ankur"
  end
end