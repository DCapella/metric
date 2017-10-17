require 'faker'

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

RegisteredApplication.create!(
  name: 'This is for Admin.',
  url: 'http://www.admin.com',
  user: user
)

RegisteredApplication.create!(
  name: 'This is for Test.',
  url: 'http://www.test.com',
  user: user_test
)

10.times do
  RegisteredApplication.create!(
    name: Faker::Science.unique.element,
    url: Faker::Internet.unique.url,
    user: user
  )
end

10.times do
  RegisteredApplication.create!(
    name: Faker::Science.unique.element,
    url: Faker::Internet.unique.url,
    user: user_test
  )
end
applications = RegisteredApplication.all

100.times do
  Event.create!(
    registered_application: applications.sample,
    name: Faker::Coffee.blend_name
  )
end

puts "Seed finished"
puts "#{User.count} User(s) created"
puts "#{User.first.email} is the first one"
puts "#{RegisteredApplication.count} applications registered"
puts "#{Event.count} events created"
