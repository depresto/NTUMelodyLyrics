class Image < ActiveRecord::Base
	validates_presence_of :name, :hash
	belongs_to :club_property
end