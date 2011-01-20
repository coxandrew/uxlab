class Screen < ActiveRecord::Base
  belongs_to :flow
  has_attached_file :image, :styles => { :thumb => "100x100#" }

  validates_attachment_presence :image

  def friendly_name
    "Screen"
  end
end
