# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.create first_name: "John",
#            last_name: "Trigger",
#            username: "john-big-daddy",
#            password: "testuseraccount",
#            email: "jt@example.com",
#            birthday: "1995-02-21"

40.times do
  Post.create title: Faker::Lorem.word,
              body: Faker::Lorem.sentence(10),
              user_id: 1
end
