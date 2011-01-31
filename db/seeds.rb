# Roles
owner  = Role.create(:name => "owner")
member = Role.create(:name => "member")
viewer = Role.create(:name => "viewer")

# Admin user
admin = User.create(
  :password => 'password',
  :password_confirmation => 'password',
  :username => 'admin'
)