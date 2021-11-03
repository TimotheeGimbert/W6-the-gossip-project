# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Like.destroy_all
Comment.destroy_all
PrivateMessageRecipientJoin.destroy_all
PrivateMessage.destroy_all
GossipTagJoin.destroy_all
Tag.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all

User.create(name: 'Anonymous', city: City.create(name: 'Web'))

10.times do
  city = City.create(name: Faker::Address.city)
  puts city
end

10.times do
  tag = Tag.create(name: Faker::Lorem.word)
  puts tag
end

10.times do
  user = User.create(name: Faker::Name.first_name, city: City.all.sample(1)[0], description: Faker::Lorem.paragraph(sentence_count: 3))
  puts user
end

20.times do
  g = Gossip.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph(sentence_count: 5), user: User.all[rand(1..User.all.length-1)])
  puts g
end

Gossip.all.each do |current|
  rand(1..3).times do
    GossipTagJoin.create(gossip: current, tag: Tag.all.sample(1).first)
  end
end

20.times do
  pm = PrivateMessage.create(content: Faker::Lorem.paragraph(sentence_count: 2), sender: User.all[rand(1..User.all.length-1)])
  puts pm
end

PrivateMessage.all.each do |current_pm|
  User.all.reject{|current_user| current_user == current_pm.sender}.sample(rand(1..9)).each do |current_recipient|
    PrivateMessageRecipientJoin.create(private_message: current_pm, recipient: current_recipient)
  end
end

20.times do
  comment = Comment.new(content: Faker::Lorem.paragraph(sentence_count: 2), user: User.all[rand(1..User.all.length-1)])
  comment.commentable = Gossip.all.sample(1).first
  comment.save
  puts comment
end

20.times do
  comment = Comment.new(content: Faker::Lorem.paragraph(sentence_count: 1), user: User.all[rand(1..User.all.length-1)])
  comment.commentable = Comment.all.sample(1).first
  comment.save
  puts comment
end

20.times do
  Like.create(user: User.all.sample(1).first, likeable: Gossip.all.sample(1).first)
end

20.times do
  Like.create(user: User.all.sample(1).first, likeable: Comment.all.sample(1).first)
end
