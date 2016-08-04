# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(user_name: "CatLover", password: "password")

user2 = User.create(user_name: "CatsAreMyLife", password: "password123")

user3 = User.create(user_name: "LonelyCatLover", password: "password1234")

Cat.create(user_id: user1.id, name: "fluffy", color: "orange", sex: "F", birth_date: Date.new(1999, 4, 9), description: "newest cat")
Cat.create(user_id: user1.id, name: "kitty", color: "white", sex: "F", birth_date: Date.new(2009, 4, 9), description: "is fun")
Cat.create(user_id: user2.id, name: "Garfield", color: "orange", sex: "M", birth_date: Date.new(1970, 3, 9), description: "likes lasagna")
