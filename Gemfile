source 'https://rubygems.org'

ruby "2.1.2"
gem 'rails', '4.1.6'

# Use Bootstrap
gem 'bootstrap-sass', '~> 3.3.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'

#It is also recommended to use Autoprefixer with Bootstrap to add browser vendor prefixes automatically.
gem 'autoprefixer-rails'

gem "paperclip", "~> 4.2"

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
#for storing images
gem "paperclip-dropbox", ">= 1.1.7"
#for protecting our account data on dropbox
gem "figaro"

gem 'devise'
gem 'simple_form', '~> 3.1.0.rc1'

gem 'activeadmin', github: 'activeadmin'

gem 'wicked'

gem 'aws-sdk', '< 2.0'

gem 'bootstrap-editable-rails'
#rating system
#gem 'ratyrate', :github => 'wazery/ratyrate'

gem 'youtube_it'

#Search
gem 'searchkick'

gem 'omniauth'

gem 'omniauth-facebook'

group :production do 
	gem 'pg'
	gem 'rails_12factor'
	
end

group :development, :test do
	gem 'sqlite3'
end

group :doc do
	gem 'sdoc', '~> 0.4.0', require: false
end


