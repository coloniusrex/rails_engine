source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 5.2.4', '>= 5.2.4.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3'
gem 'pry'
gem 'rack-cors'
gem 'active_model_serializers', '~> 0.10.0'
gem 'fast_jsonapi'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'simplecov', require: false, group: :test
gem 'money'

 group :test do
    gem 'shoulda-matchers'
 end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'capybara'
  gem 'faker'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
