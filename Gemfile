source "https://rubygems.org"

gem "rails", "~> 8.0.2"

gem "propshaft"
gem "sqlite3", ">= 2.1"
gem "puma", ">= 5.0"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "bootsnap", require: false
gem "kamal", require: false
gem "thruster", require: false

gem "devise"
gem "haml-rails"
gem "simple_form"
gem "pagy"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  # gem "rubocop-rails-omakase", require: false
  gem "faker"
  
  gem "sgcop", github: "SonicGarden/sgcop"
  gem "haml-lint"
  gem "bullet"
  gem "factory_bot_rails"
  gem "rspec-rails"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
