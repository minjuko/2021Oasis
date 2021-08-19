# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w( main_cssrequire.css )
Rails.application.config.assets.precompile += %w( sign-in.css )
Rails.application.config.assets.precompile += %w( find-password.css )
Rails.application.config.assets.precompile += %w( edit-profile.css )
Rails.application.config.assets.precompile += %w( profile.css )
Rails.application.config.assets.precompile += %w( ride.css )
Rails.application.config.assets.precompile += %w( newride.css )
Rails.application.config.assets.precompile += %w( resInfo.css )
Rails.application.config.assets.precompile += %w( finish.css )
Rails.application.config.assets.precompile += %w( collect.css )
Rails.application.config.assets.precompile += %w( full.css )
Rails.application.config.assets.precompile += %w( complete.css )
Rails.application.config.assets.precompile += %w( chatlist.css )
Rails.application.config.assets.precompile += %w( a.css )
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
