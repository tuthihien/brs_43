User.create!(username:  "tuthihien",
  email: "tuthihien@gmail.com",
  password: "123123",
  password_confirmation: "123123",
  is_admin: true)

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(username: name,
  email: email,
  password: password,
  password_confirmation: password)
end
