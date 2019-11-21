# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
posts = Post.create([{ title: 'some title', content: 'some long long content' }])
comments = Comment.create([{ name: 'commenter', content: 'co co coment ! !', post: posts.first}])
