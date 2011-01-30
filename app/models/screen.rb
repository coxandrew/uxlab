class Screen < ActiveRecord::Base
  belongs_to :flow
  has_attached_file :image,
    :styles => { :thumb => "200x200#" },
    :storage => :s3,
    :path => ":attachment/:id/:style/:basename.:extension",
    :s3_credentials => "#{Rails.root.to_s}/config/s3.yml"

  validates_attachment_presence :image
end
