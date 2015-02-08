FactoryGirl.define do
  factory :cart do
  end

  factory :line_item do
    item
    cart
  end

  factory :item do
    sequence :title do |n|
      "title#{n}"
    end
    sequence :description do |n|
      "description#{n}"
    end
    sequence :price do |n|
      n + 1
    end
    categories {[create(:category)]}
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
    factory :admin_user do
      admin true
    end
  end
end