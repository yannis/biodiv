FactoryGirl.define do
  factory :laboratory do
    name_fr {Faker::Name.title}
    association :institute
  end
end
