source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.4'
gem 'sqlite3', group: :development
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootstrap-sass', '3.3.6'
gem "jquery-slick-rails"
gem "font-awesome-rails"
gem 'devise'
gem 'toastr-rails'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'geocoder'
gem 'mysql2'
# Image Uploader
gem 'carrierwave', '1.2.2'
gem 'mini_magick', '4.8.0'
gem 'slim'
gem 'redis'
gem 'jquery-ui-rails'
gem "refile", github: 'refile/refile', require: "refile/rails"
gem "refile-mini_magick", github: 'refile/refile-mini_magick'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'firebase'
gem 'geokit-rails'
gem "figaro", "~> 1.1.0"

group :development, :test do

  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

# 本番ではpostgressを使用する
group :production do
  gem 'pg'
  gem 'fog-aws'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
