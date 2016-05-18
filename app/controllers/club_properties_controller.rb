class ClubPropertiesController < ApplicationController
	before_action :set_image, only: [:edit, :update, :destroy]

	def index
		# @property 		= Image.select('"club_properties"."id", "club_properties"."name", "storage", "type"').joins('INNER JOIN "club_properties" ON "images"."id" = "club_properties"."image_id"')
		@property 		= ClubProperty.all
		@property_form 	= ClubProperty.new
	end

	def create
		# if !Dir.exists?(Rails.root.join('public', 'upload'))
		# 	Dir.mkdir(Rails.root.join('public', 'upload'))
		# end

		# param 		= params[:club_property]
		# filename 	= data.original_filename

		# Save images to Cloudinary
		# i 			= Image.new
		# i.name 		= filename
		# i.storage 	= param[:image]
		# i.save!

		# Save to Properties
		case param[:type]
	    	when 'keyboard' then c = BorrowKeyboard.new(club_property_params)
	    	when 'book'     then c = BorrowBook.new(club_property_params)
	    end
		# c.name 			= param[:name]
		# c.borrowable 	= param[:borrowable]
		# c.image_id		= i.id
		# c.image			= param[:image]
		c.save!

		# File.open(Rails.root.join('public', 'upload', filename), 'wb+') do | f |
		# 	f.write data.read
		# 	f.close
		# end

	end

	def edit
	end

	def update
	end

	def destroy
		@property.destroy
	end

	private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_club_property
	    	@property = ClubProperty.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def club_property_params
	    	params.require(:club_property).permit(:name, :borrowable, :image)
	    end
end