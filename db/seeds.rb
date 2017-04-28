# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(firstname:"example", surname:"example", email:"example@example.com",
            password:"password", password_confirmation: "password");

99.times do |n|

  name = Faker::Name.name
  arr = name.split()
  firstname = arr[0]
  surname = arr[1]
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(firstname: firstname, surname: surname, email: email, password: password, password_confirmation: password)

end


users = User.order(:created_at).take(10)
30.times do
  content = Faker::Lorem.sentence(5)
  title = Faker::App.name
  users.each { |user| user.posts.create!(title: title,body: content) }
end
