# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
User.create(name:"Pan i Wladca", email: "1@admin.org", password: "adminadmin1", role: "admin")
User.create(name:"Szary user", email: "1@user.org", password: "useruser1", role: "admin")
