class Drum < ActiveRecord::Base
  validates :picture, presence: true, uniqueness: true
  validates :drummer_id, presence: true
  belongs_to :drummer
  # mount_uploader :picture, PictureUploader
end
