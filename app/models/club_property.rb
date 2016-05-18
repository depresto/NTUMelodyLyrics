class ClubProperty < ActiveRecord::Base
	validates_presence_of :name, :borrowable

	mount_uploader :image, ImageUploader
end