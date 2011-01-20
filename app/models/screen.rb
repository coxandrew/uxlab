class Screen < ActiveRecord::Base
  belongs_to :flow
  has_attached_file :image, :styles => { :thumb => "100x100#" }
end
