source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'

gem 'pg'
gem 'puma', '~> 3.11'
gem 'redis', '~> 4.0'
gem 'bootsnap', '>= 1.1.0', require: false

# Auth
gem 'bcrypt', '~> 3.1.7'
gem 'doorkeeper', '5.0.0'

# API
gem 'rack-cors'
gem 'active_model_serializers'
gem 'validates_email_format_of'
gem 'api-pagination'

group :development, :test do
  gem 'pry'
  gem 'rubocop', '0.59.2'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  gem 'shoulda'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'figaro', '~> 1.2'
gem 'faker'
gem 'will_paginate', '~> 3.3'
