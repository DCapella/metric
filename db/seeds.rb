require 'random_data'

user = User.new(
  email: 'Admin@admin.com',
  password: 'adminpassword',
  password_confirmation: 'adminpassword',
  confirmed_at: Time.now
)

user_test = User.new(
  email: 'test@test.com',
  password: 'testpassword',
  password_confirmation: 'testpassword',
  confirmed_at: Time.now
)
user.save!
user_test.save!

Application.create!(
  name: 'This is for Admin.',
  url: 'http://www.admin.com',
  user: user
)

Application.create!(
  name: 'This is for Test.',
  url: 'http://www.test.com',
  user: user_test
)

10.times do
  Application.create!(
    name: RandomData.random_sentence,
    url: RandomData.random_url,
    user: user
  )
end

10.times do
  Application.create!(
    name: RandomData.random_sentence,
    url: RandomData.random_url,
    user: user_test
  )
end

puts "Seed finished"
puts "#{User.count} User(s) created"
puts "#{User.first.email} is the first one"
puts "#{Application.count} applications registered"
