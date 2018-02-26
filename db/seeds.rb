# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#20.times do
#  Project.create(name: Faker::Movie.quote)
#end

1020.times do
  Task.create(name: Faker::Book.title, status: Faker::Team.state, project_id: Faker::Number.between(1, 20) )
end