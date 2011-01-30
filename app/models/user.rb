class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation
  attr_accessor :password

  has_many :assignments
  has_many :roles, :through => :assignments
  has_many :projects, :through => :assignments

  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4, :allow_blank => true
  validates_uniqueness_of :username

  before_save :prepare_password

  def self.authenticate(login, pass)
    user = find_by_username(login)
    return user if user && user.matching_password?(pass)
  end

  def matching_password?(pass)
    self.password_hash == encrypt_password(pass)
  end

  def role_in_project?(role, project)
    assignments.where(
      :role_id    => Role.find_all_by_name(role),
      :project_id => project.id
    ).count > 0
  end

  def add_role_to_project(role, project)
    Assignment.find_or_initialize_by_user_id_and_project_id(
      :user_id    => self.id,
      :project_id => project.id
    ).update_attributes(:role_id => role.id)
  end

  private

  def prepare_password
    unless password.blank?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = encrypt_password(password)
    end
  end

  def encrypt_password(pass)
    BCrypt::Engine.hash_secret(pass, password_salt)
  end
end
