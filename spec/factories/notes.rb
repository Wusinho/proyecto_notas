FactoryBot.define do
  factory :note do
    title { "MyString" }
    body { "MyString" }
    note_date { "2023-03-04" }
    user
  end
end
