FactoryGirl.define do
  factory :admin, class: User do
    email "admin@admin.com"
    password "admin"
    password_confirmation "admin"
    admin true
  end
end
