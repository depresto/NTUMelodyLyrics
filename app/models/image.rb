class Image < ActiveRecord::Base
	validates_presence_of :name, :hash
end