class Drum < ActiveRecord::Base
  validates :picture, presence: true
  belongs_to :drummer
  mount_uploader :picture, PictureUploader
end
