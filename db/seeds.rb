require 'faker'


## Create 10 cities
# 10.times do
#   City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
# end

## Create 10 users
# 10.times do 
#   User.create(first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     description: Faker::Lorem.sentence(word_count: 50 + rand(200)),
#     email: Faker::Internet.free_email,
#     age: Faker::Number.between(from: 7, to: 77),
#     city: City.all.sample
#   )
# end

## Create 20 gossips
# 20.times do
#   Gossip.create(title: Faker::Movie.title, content: Faker::Lorem.sentence(word_count: 50 + rand(100)), user: User.all.sample)
# end

## Create 30 comments
30.times do
  Comment.create(content: Faker::Lorem.sentence(word_count: 50 + rand(100)), user: User.all.sample, gossip: Gossip.all.sample )
end

## Create 10 tags
# 10.times do
#   Tag.create(title: Faker::String.random(length: 4 + rand(12)))
# end


## Create Db of 40 joins
# 40.times do
#   JoinTableTagGossip.create(gossip: Gossip.all.sample, tag: Tag.all.sample)
# end

## Create Db of PM sent from One user to one or many users
# 20.times do
#   content = Faker::Lorem.sentence(word_count: 50 + rand(100))
#   sender = User.all.sample
#   rand(9).times do 
#     recipient = User.all.sample
#     PrivateMessage.create(content: content,
#       recipient: recipient, sender: sender)
#   end
# end