class Flow < ActiveRecord::Base
  belongs_to :project
  has_many :screens
end
