class Feature < ActiveRecord::Base
  belongs_to :project
  has_many :flows

  validates_presence_of :name
end
