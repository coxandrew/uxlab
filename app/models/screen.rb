class Screen < ActiveRecord::Base
  belongs_to :flow
  has_attached_file :image
end
