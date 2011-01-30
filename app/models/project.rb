class Project < ActiveRecord::Base
  attr_accessible :name, :description

  belongs_to :owner, :class_name => "User"
  has_many :features, :dependent => :destroy
  has_many :assignments
  has_many :members, :through => :assignments, :source => :user
end
