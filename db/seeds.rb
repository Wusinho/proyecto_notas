# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
password = '123456'

25.times.each { |index| User.create(email: "user_#{index}@gmail.com", password: password, password_confirmation: password) }

users = User.all

users.each do |user|
  no = [5, 8].sample
  no.times do
    Note.create(
      user_id: user.id,
      title: Faker::Book.title,
      body: Faker::Lorem.sentences(number: [16,20,28].sample).join(''),
      note_date: Date.today + [4,8,12].sample.to_d)
  end
end

