# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
u1 = User.new(name: 'Test Account', email: 'test@mail.com', password: 'password')
u1.save

# User 1 Categories

Category.create(user_id: u1.id, name: 'Leisure', icon: 'https://img.icons8.com/2266EE/color/debt')
Category.create(user_id: u1.id, name: 'Groceries', icon: 'https://img.icons8.com/2266EE/color/plastic-bag')
Category.create(user_id: u1.id, name: 'Investment', icon: 'https://img.icons8.com/2266EE/color/sport')
Category.create(user_id: u1.id, name: 'Pet', icon: 'https://img.icons8.com/2266EE/color/dog')