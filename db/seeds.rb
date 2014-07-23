# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

DEPARTMENTS = ['Computer Science', 'Nature', 'Other']

puts 'Creating default Departments'
DEPARTMENTS.each do |department|
  Department.create(name: department)
end

STATUSES = ["Waiting for Staff Response", "Waiting for Customer",
            "On Hold", "Cancelled", "Completed"]

puts 'Creating default Statuses'
STATUSES.each do |status|
  Status.create(name: status)
end

STAFF = ["john@mail.com", "steve@mail.com", "bean@mail.com"]
puts 'Creating default Staff members'
puts "emails: #{STAFF.join(',')}"
puts 'Default password is password'

STAFF.each do |email|
  User.create(email: email, password: 'password', password_confirmation: 'password')
end

