class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation
  attr_accessor :password

  has_one :assignment
  has_one :role, :through => :assignment
  has_many :projects, :foreign_key => "owner_id"

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

  def role?(role)
    self.role == Role.find_by_name(role)
  end

  def self.with_role(role)
    joins(:role).where(:roles => {:name => role})
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
