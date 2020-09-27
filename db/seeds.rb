Tweet.delete_all
User.delete_all




50.times do
  User.create([{ name: Faker::Name.name, email: Faker::Internet.email, image_url: Faker::LoremPixel.image,  password:"123456" ,password_confirmation:"123456" }])
end

80.times do
    user = rand(50)
    Tweet.create([{ content: Faker::Lorem.paragraph, user_id: user}])
end