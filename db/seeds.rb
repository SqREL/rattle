# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
40.times do
  User.create! name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password(8)
end

putc '.'

100.times do
  Post.create! title: Faker::Lorem.sentence, url: Faker::Internet.url, owner: User.order("RANDOM()").first
end

putc '.'

User.find_each do |user|
  Post.find_each do |post|
    user.vote_for post, ['up', 'down'].shuffle.first
    post.comments.create!(owner: user, body: Faker::Lorem.sentence(2))
  end
end

putc '.'

User.find_each do |user|
  parent = Comment.order("RANDOM()").first
  parent.children.create!(owner: user, body: Faker::Lorem.sentence(2), post_id: parent.post_id)
end
putc '.'

Post.find_each { |p| RatingService.recalculate_rating_for!(p) }
putc '.'
