class Feature < ActiveRecord::Base
  belongs_to :project
  has_many :flows, :dependent => :destroy

  validates_presence_of :name
end
