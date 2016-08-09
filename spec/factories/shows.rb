FactoryGirl.define do
  factory :show do
    date { 5.days.ago }
    venue
    band
  end

end
