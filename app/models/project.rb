class Project < ActiveRecord::Base
  has_many :features, :dependent => :destroy
  belongs_to :owner, :class_name => "User"
end
