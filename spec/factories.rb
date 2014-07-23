FactoryGirl.define do
  factory :ticket do
    sequence(:body) {|n| "Ticket body number #{n}"}
    sequence(:email) { |n| "user#{n}@mail.com" }
    association :department
    association :status
  end

  factory :department do
    sequence(:name) {|n| "Department with name #{n}"}
  end

  factory :status do
    name 'Waiting for Staff Response'
  end

  factory :user do
    sequence(:email) {|n| "user_#{n}@mail.com"}
    password 'password'
    password_confirmation { |u| u.password }
  end
end
