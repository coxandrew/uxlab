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

uni_web = Project.create(:name => "University Web",
  :description => "School administration app for Ruby Mendicant University")
admin_users = Feature.create(:name => "User Administration",
  :description => "Add, edit and delete users. Assign permissions. Track students' progress throughout a course.",
  :project_id => uni_web.id)
admin_courses = Feature.create(:name => "Course Administration",
  :description => "Create and manage courses. Add students and instructors to a course.",
  :project_id => uni_web.id)

Flow.create(:name => "Add user to RMU",
  :feature_id => admin_users.id)
Flow.create(:name => "Add users to course",
  :feature_id => admin_courses.id)

ux_lab = Project.create(:name => "UX Lab",
  :description => "A resource manager for storing and sharing design images and documents for a project.")
Feature.create(:name => "Projects",
  :description => "A project is the main organizational element that contains all of your features.",
  :project_id => ux_lab.id)
Feature.create(:name => "Features",
  :description => "Group your project into meaningful, MMFs (minimally marketable features).",
  :project_id => ux_lab.id)
Feature.create(:name => "User Flows",
  :description => "Add flows from the user's perspective for all important UI interactions. Flows will include a set of re-orderable screenshots.",
  :project_id => ux_lab.id)