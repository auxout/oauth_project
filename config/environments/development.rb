OauthProject::Application.configure do
	
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = false
end

Devise.setup do |config|
	require 'openid/store/filesystem'
	config.omniauth :twitter, "myRGhFRnHffCAwyes4rrnA", "kTKrnOc5HHokLdfkYLOMn0UyrzzyzsxGI3RdM89G0"
  config.omniauth :facebook, "132916926801764", "3dddd3486fcf6b91b3b62e6708dfd26a"
  config.omniauth :open_id, OpenID::Store::Filesystem.new('/tmp')
  config.omniauth :open_id, OpenID::Store::Filesystem.new('/tmp'), :name => 'mixi', :identifier => 'https://mixi.jp'
end
