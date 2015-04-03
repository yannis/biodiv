source "http://rubygems.org"

gem "rails", "4.2.1"

gem "mysql2"
gem "figaro"
gem 'rails-i18n', '~> 4.0.0'

gem "haml-rails"
gem 'sass-rails', '~> 5.0'
gem 'compass-rails', '~> 2.0.4'
gem "bootstrap-sass"
gem "font-awesome-sass"
gem "autoprefixer-rails"
gem "jquery-rails"

gem "devise"
gem "activeadmin", github: "activeadmin"

gem "rmagick"
gem "carrierwave"

gem "airbrake"

# gem "capistrano"
# gem "capistrano-bundler"
# gem "capistrano-rbenv"
# gem "capistrano-maintenance"

group :development do
  gem "spring"
  gem "guard"
  gem "guard-rspec"
  gem "guard-bundler"
  gem "guard-livereload"
  # gem "guard-spring"
  gem "quiet_assets"
end

group :test do
  gem "rspec-rails"
  # gem "rspec-retry"
  gem "rspec-its"
  gem "capybara"
  gem "shoulda-matchers", require: false
  gem "capybara-screenshot"
  gem "database_cleaner"
  gem "selenium-webdriver"
end


group :development, :test do
  gem "email_spec"
  gem "byebug"
  gem "factory_girl_rails"
  gem "faker"
end


group :production do
end
