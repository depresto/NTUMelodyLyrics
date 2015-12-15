# This configuration file works with both the Compass command line tool and within Rails.
# Require any additional compass plugins here.
project_type 	= :rails
http_path 		= "/"

css_dir			= "public/css"
sass_dir		= "app/assets/stylesheets"
images_dir		= "app/assets/images"

http_images_path 			= http_path + '/images/' + images_dir
generated_images_dir 		= "public/images"
http_generated_images_path 	= http_path + '/images/' + generated_images_dir

output_style 	= :compressed
line_comments 	= false