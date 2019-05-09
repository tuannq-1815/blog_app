User.create! name: "tuan",
             email: "tuan@gmail.com",
             password: "123456",
             password_confirmation: "123456",
             admin: true
User.create! name: "test",
             email: "test@gmail.com",
             password: "123456",
             password_confirmation: "123456"
99.times do |n|
  name  = FFaker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create! name:  name,
               email: email,
               password: password,
               password_confirmation: password
end
users = User.order(:created_at).take(6)
50.times do
  content = FFaker::Lorem.sentence(5)
  users.each { |user| user.entries.create!(content: content) }
end
