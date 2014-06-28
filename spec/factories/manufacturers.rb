FactoryGirl.define do
  factory :manufacturer do
    sequence(:name) {|n| "Japanese Automaker ##{n}"}
    country "Japan"
  end
end
