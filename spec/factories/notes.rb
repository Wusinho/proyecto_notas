FactoryBot.define do
  factory :note do
    title { Faker::Book.title }
    body { Faker::Lorem.sentences(number: [8,16,20,28].sample).join('') }
    note_date { Date.today + [2,4,8].sample.to_d }
    user
  end
end
