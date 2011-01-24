class Feature < ActiveRecord::Base
  belongs_to :project
  has_many :flows

  validates_presence_of :name

  def friendly_name
    "Feature"
  end
end
