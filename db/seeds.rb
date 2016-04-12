# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do |i|
	user = User.create(email: "test#{i}@test.com", password: '222222', password_confirmation: '222222', name: "test#{i}")
	post = Post.create(title: "post #{i} title", body: "post #{i} body" * 20, user_id: user.id)

	rand(20).times do |j|
		article = Article.create(title: "Article #{j}", body: "Article #{j} body", user_id: user.id, post_id: post.id)
		rand(20).times do |k|
			comment = Comment.new(user_id: User.all.sample(1).first.id, body: "Comment #{k}")
			comment.commentable = article
			comment.save
		end
	end

	rand(20).times do |k|
		comment = Comment.new(user_id: User.all.sample(1).first.id, body: "Comment #{k}")
		comment.commentable = post
		comment.save
	end
end

10.times do |i|
	Tag.create(name: "tag#{i}")
end
