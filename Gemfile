source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Amazon Web Services gem for picture storage service
gem 'aws-sdk-s3', '~> 1'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
# bootstrap sass for styles
gem 'bootstrap', '~> 4.3.1'
# Devise
gem 'devise'
# Dropzone for drag and drop
gem 'dropzonejs-rails'
# Gem to help with the credentials to AWS
gem 'fog-aws'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Jquery for bootstrap
gem 'jquery-rails'
# Kaminari gem for add pagination
gem 'kaminari'
# Use this gem to complement premailer gem.
gem 'nokogiri'
# Paperclip for customise profile picture
gem 'paperclip', '~> 6.1.0'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use premailer to keep the css styles on the email clients.
gem 'premailer-rails'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use Redis to store an in-memory data structure
gem 'redis', '~> 4.1.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0'
# Use sidekiq to handle the background jobs
gem 'sidekiq'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'rubycritic', require: false
end

group :development do
  gem 'erb_lint'
  # This gem is to simulate sending a confirmation email locally.
  gem "letter_opener"
  gem 'listen', '>= 3.0.5', '< 3.3'
  gem 'rubocop-rails'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'action-cable-testing'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'rails-controller-testing'
  gem 'rspec_junit_formatter'
  gem 'rspec-sidekiq'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end
