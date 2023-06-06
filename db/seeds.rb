# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user1 = User.create(name:"Jishan")
user2 = User.create(name:"keya")

category1 = Category.create(name:"car", icon:"https://img.icons8.com/2266EE/color/car", user:user1)
category2 = Category.create(name:"sport", icon:"https://img.icons8.com/2266EE/color/sport", user:user1)

category3 = Category.create(name:"make-up", icon:"https://img.icons8.com/?size=512&id=FrWKbpynUJrB&format=png", user:user2)


expense1 = Expense.create(name: "Expense 1", amount: 100, author:user1)
expense2 = Expense.create(name: "Expense 2", amount: 200, author:user1)

category1.expenses << expense1
category2.expenses << expense2