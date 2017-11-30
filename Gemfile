source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem "rails", "~> 5.0.4"
gem "puma", "~> 3.0"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "jquery-rails"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"

gem "bootstrap-sass"
gem "font-awesome-rails"

gem "carrierwave"
gem "cloudinary"
gem "mini_magick", "3.8.0"
gem "config"
gem "pry-rails"
gem 'will_paginate', '~> 3.1.0'
gem "bootstrap-will_paginate"

gem "devise"
gem "cancancan", "~> 1.10"
gem "nested_form"
gem "ransack", github: 'activerecord-hackery/ransack'

gem "searchkick"

group :development, :test do
  gem "byebug", platform: :mri
  gem "pry"
  gem "sqlite3"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :production, :heroku do
  gem "pg"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
