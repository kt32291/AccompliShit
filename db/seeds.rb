# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

todos = [
{
  content: "Take dog for walk",
  category: "org",
  user_id: 1
},
{
  content: "Go to Zumba at 3",
  category: "fit",
  user_id: 1
},
{
  content: "Buy more protein powder",
  category: "fit",
  user_id: 1
},
{
  content: "Return email to Sarah",
  category: "work",
  user_id: 1
},
{
  content: "Work on layout for cover",
  category: "work",
  user_id: 1
},
{
  content: "Meet Emma for coffee meeting",
  category: "work",
  user_id: 1
},
{
  content: "100 copies of fliers",
  category: "work",
  user_id: 1
},
{
  content: "Do dishes",
  category: "org",
  user_id: 1
},
{
  content: "Laundry",
  category: "org",
  user_id: 1
},
{
  content: "Drinks with Adam tonight",
  category: "play",
  user_id: 1
},
{
  content: "Dinner party tomorrow",
  category: "play",
  user_id: 1
},
]

Todo.destroy_all
Badge.destroy_all

todos.each do |todo|
  t = Todo.new
  t.content = todo[:content]
  t.category = todo[:category]
  t.user_id = todo[:user_id]
  t.save
end
require "#{Rails.root}/db/gioco/db.rb"
