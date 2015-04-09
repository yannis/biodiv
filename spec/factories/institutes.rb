FactoryGirl.define do
  factory :institute do
    name_fr {Faker::Name.title}
    description_fr {Faker::Lorem.paragraph(2, true, 4)}
  end
end
