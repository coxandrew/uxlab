class Flow < ActiveRecord::Base
  belongs_to :feature
  has_many :screens
end
