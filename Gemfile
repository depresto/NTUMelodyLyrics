source 'https://rubygems.org'

# Define Ruby version
ruby '2.3.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use SCSS for stylesheets
gem 'sprockets'
# fix sass image-url() bugs
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'compass-rails', '~> 2.0.2'
# Use Compass for sass compile
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem "slim-rails"
# Use Slim

gem "bower-rails", "~> 0.10.0"
# Use Bower

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-turbolinks'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'jquery_mobile_rails'
# jQuery Mobile
gem "font-awesome-rails"
# Font Awesome
gem 'modernizr-rails'
# Modenizr
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem "js-routes"

gem 'remotipart'
#gem 'remotipart', github: 'mshibuya/remotipart', ref: '3a6acb3'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Heroku server
gem 'puma'

gem 'dotenv-rails', :groups => [:development, :test]

# File upload
gem 'carrierwave'
# Cloudinary Cdn
gem 'cloudinary'
# Imgur Image
# gem 'imgurapi'
# gem 'ruby-imgur'

# File upload
# gem "paperclip", "~> 5.0.0.beta1"
# PaperClip for Imgur
# gem 'paperclip-imgur'

# PaperClip for Google Drive
# gem 'paperclip-googledrive'
# gem 'paperclip-googledrive-new'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  gem 'sqlite3'

  # gem 'guard'
  # gem 'guard-livereload'
  # gem 'rack-livereload'
  gem 'rb-inotify', :require => false
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem 'pg'

  # gem 'rack-cache', :require => 'rack/cache'

  gem 'rails_12factor'
end