source 'https://rubygems.org'

ruby '2.0.0'

# Back-End
gem 'rails', '4.0.2'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks'

# API
gem 'grape', '~> 0.6.1'
gem 'grape-entity', '~> 0.3.0'
gem 'grape-swagger', git: 'git://github.com/Phobos98/grape-swagger.git'
gem 'grape-swagger-ui'
gem 'grape_has_scope'
gem 'grape-active_model_serializers'

# Data
gem 'pg'
gem 'will_paginate'
gem 'acts-as-taggable-on'
gem 'active_model_serializers'
gem 'jbuilder', '~> 1.2'

# Front-End
gem 'haml'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'angularjs-rails'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'shotgun'                                                                           #autoload web-server (when grape-api changes)
  gem 'thin'                                                                              #speed web-server
  gem 'awesome_print'                                                                     #better print
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
