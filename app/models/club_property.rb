class ClubProperty < ActiveRecord::Base
	validates_presence_of :name, :borrowable

	mount_uploader :image, ImageUploader

	has_many :borrow_list, 	dependent: :destroy
end