# Roles
owner  = Role.create(:name => "owner")
member = Role.create(:name => "member")
viewer = Role.create(:name => "viewer")

# Users
user_defaults = { :password => 'tronguy', :password_confirmation => 'tronguy' }
greg    = User.create(user_defaults.merge(:username => 'seacreature'))
jordan  = User.create(user_defaults.merge(:username => 'jordanbyron'))
tronguy = User.create(user_defaults.merge(:username => 'tronguy'))
cox     = User.create(user_defaults.merge(:username => 'cox'))

# University Web
uni_web = Project.create(
  :name => "University Web",
  :description => "School administration app for Ruby Mendicant University",
  :owner_id => jordan.id)
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
Flow.create(:name => "Add new IRC channel to course",
  :feature_id => admin_courses.id)

# UX Lab
ux_lab = Project.create(
  :name => "UX Lab",
  :description => "A resource manager for storing and sharing design images and documents for a project.",
  :owner_id => cox.id)
Feature.create(:name => "Projects",
  :description => "A project is the main organizational element that contains all of your features.",
  :project_id => ux_lab.id)
Feature.create(:name => "Features",
  :description => "Group your project into meaningful, MMFs (minimally marketable features).",
  :project_id => ux_lab.id)
Feature.create(:name => "User Flows",
  :description => "Add flows from the user's perspective for all important UI interactions. Flows will include a set of re-orderable screenshots.",
  :project_id => ux_lab.id)

# User Roles
jordan.add_role_to_project(owner, uni_web)
jordan.add_role_to_project(member, ux_lab)

tronguy.add_role_to_project(viewer, uni_web)

greg.add_role_to_project(member, uni_web)
greg.add_role_to_project(viewer, ux_lab)

cox.add_role_to_project(owner, ux_lab)
cox.add_role_to_project(member, uni_web)