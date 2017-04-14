source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '~> 1.0'
gem 'hanami-model', '~> 1.0'

gem 'pg'

gem 'coffee-script'
gem 'sass'
gem 'haml'

# auth
gem 'roda'
gem 'omniauth-github'

group :development do
  gem 'rubocop'
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun'
end

group :test, :development do
  gem 'dotenv', '~> 2.0'
end

group :test do
  gem 'rspec'
  gem 'rspec-hanami'
  gem 'capybara'
end

group :production do
  # gem 'puma'
end
