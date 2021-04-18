50.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
                 email: email,
                 image: open("./app/assets/images/prof.png"),
                 password: password,
                 password_confirmation: password,
                 )
end
