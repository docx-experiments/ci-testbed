source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'rails', '~> 7.0.3'
gem 'puma', '~> 4.1'
gem 'mysql2'

gem 'tzinfo-data'

gem 'whenever', '0.9.7', require: false
gem "fluent-logger"
gem "statsd-client"

gem "activerecord"
gem "aws-sdk"
gem "connection_pool"
gem "choices"
gem "daemons"
gem "delayed_job"

gem "faraday"
gem "gmail_xoauth"

gem "immutable_struct"
gem 'influxdb'
gem "invariant"

gem "nokogiri"
gem "redis"

gem 'yajl-ruby', require: 'yajl'

gem 'rbtrace', require: false
gem "stackprof", require: false

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'database_cleaner-active_record'
  gem "pry"
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end

