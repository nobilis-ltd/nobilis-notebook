source 'https://rubygems.org'

# CORE:
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
gem 'rake', '10.5.0'

# SERVER:
gem 'thin'

# FRONT_END REQUIREMENTS:
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Use sqlite3 as the database for Active Record in development and test
  gem 'sqlite3'

  # for factories
  gem 'factory_girl_rails'
  gem 'faker'

  # For loading of environment variables from .env file
  gem 'dotenv-rails'

  # For running JavaScript tests
  gem 'jasmine-rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'listen', '~> 3.0.5'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # For documentation server
  gem 'yard'
end

group :production do
  # heroku things
  gem 'pg'
  gem 'rails_12factor'
end

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# To annotate models
gem 'annotate'

# For light encryption
gem 'hashids', '~> 1.0', '>= 1.0.2'

# For selective hashids models
gem 'acts_as_hashids'

# For Google authorization
gem 'omniauth-google-oauth2'

# For Controller Specific JavaScript
gem 'paloma', '~> 5.0.0'