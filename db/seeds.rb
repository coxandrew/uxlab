# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

user_defaults = { :password => 'tronguy', :password_confirmation => 'tronguy' }
users = ['cox', 'jordanbyron', 'seacreature']
users.each do |user|
  User.create(user_defaults.merge(:username => user))
end

uni_web = Project.create(:name => "University Web")
admin_courses = Feature.create(:name => "Course Administration",
  :project_id => uni_web.id)
admin_users = Feature.create(:name => "User Administration",
  :project_id => uni_web.id)

add_users_to_course = Flow.create(:name => "Add users to course",
  :feature_id => admin_courses.id)

