source 'https://rubygems.org'
ruby '2.3.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
gem 'pg'
gem 'rgeo'
gem 'rgeo-geojson'
gem 'activerecord-postgis-adapter', '3.0.0.beta5'
gem 'sorcery'
# Use paperclip for uploading images/documents to be stored
gem "paperclip", "~> 4.2"
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
#gem 'foreigner'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'unicorn'
gem 'delayed_job_active_record'
gem "daemons"
gem 'twitter'
gem 'twitter-text'
gem 'dalli'
gem 'bitly'

gem 'font-awesome-sass'

gem 'active_link_to'

# Use Capistrano for deployment
group :development do
	gem 'capistrano', '~> 3.2.1'
	gem 'capistrano-bundler', '~> 1.1.2'
	gem 'capistrano-rails', '~> 1.1.1'
	gem 'capistrano-rbenv', github: "capistrano/rbenv"
	gem 'capistrano-secrets-yml', '~> 1.0.0'
  gem 'capistrano3-delayed-job', '~> 1.0'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

