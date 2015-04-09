FactoryGirl.define do
  factory :project do
    name_fr {Faker::Name.title}
    description_fr {Faker::Lorem.paragraph(2, true, 4)}
    association :laboratory
  end
end
