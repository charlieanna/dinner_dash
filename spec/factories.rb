FactoryGirl.define do
  factory :category do
    title 'Kitchen'
  end

  factory :line_item do
    sequence :quantity do |n|
      n
    end
    item
  end

  factory :cart do
  end

  factory :item do
    state 'Open'
    sequence :title do |n|
      "title#{n}"
    end
    sequence :description do |n|
      "description#{n}"
    end
    sequence(:price, 0) do |n|
      n + 1
    end
    sale
    categories { [create(:category)] }
  end

  factory :sale do
  end

  factory :order do
    user
    name 'Ankur Kothari'
    email 'ankothari@gmail.com'
    address 'Bangalore'
    pay_type 'Check'
    status 'ordered'
  end

  factory :review do
    user
    item
    sequence :title do |n|
      "title#{n}"
    end
    sequence :body do |n|
      "body#{n}"
    end
    stars 0
  end

  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password 'aaaaaa'
    name 'ankur'
    factory :admin_user do
      admin true
    end
  end
end
