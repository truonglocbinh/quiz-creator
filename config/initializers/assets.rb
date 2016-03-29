# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += ["*.js", "*.scss", "*.jpg", "*.png"]
Rails.application.config.assets.precompile += %w( ckeditor/* )
Rails.application.config.after_initialize do
  if defined?(WillPaginate)
    module WillPaginate
      module ActiveRecord
        module RelationMethods
          alias_method :per, :per_page
          alias_method :num_pages, :total_pages
        end
      end
    end
  end
end
