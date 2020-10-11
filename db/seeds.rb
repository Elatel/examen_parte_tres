Like.delete_all
Tweet.delete_all
User.delete_all




50.times do
  User.create([{ name: Faker::Name.name, email: Faker::Internet.email, image_url: Faker::LoremPixel.image,  password:"123456" ,password_confirmation:"123456" }])
end

60.times do
    user = rand(50)
    Tweet.create([{ content: Faker::Lorem.paragraph, user_id: user}])
end

15.times do
  tweet = rand(50)
  user = rand(50)
  Like.create([{ tweet_id: 1, user_id: user}])
end

10.times do
  user = rand(50)
  Tweet.create([{ content: Faker::Lorem.paragraph, user_id: user, origin_tweet: 1}])
end