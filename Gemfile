source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 6.1.6'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'devise'
gem 'devise-i18n'
gem 'rails-i18n'
gem 'image_processing', '>= 1.2'
gem 'mailjet'
gem 'bootstrap-icons-helper'
gem 'net-smtp', require: false
gem 'net-imap', require: false
gem 'net-pop', require: false
gem 'pundit'
gem 'omniauth'
gem 'omniauth-vkontakte'

gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'pry-rails'
  gem 'sqlite3', '~> 1.4'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'letter_opener'
end

group :production do
  gem 'aws-sdk-s3', require: false
  gem 'pg'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
