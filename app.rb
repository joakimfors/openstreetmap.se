# Use the app.rb file to load Ruby code, modify or extend the models, or
# do whatever else you fancy when the theme is loaded.

require 'i18n'
require 'i18n/backend/fallbacks'

module Nesta
  class App
    configure do
      I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
      I18n.load_path = Dir[File.join(settings.root, 'locales', '*.yml')]
      I18n.backend.load_translations
      I18n.locale = :sv
    end

    helpers do
      def format_date(date)
        I18n.localize date, :format => "%d %B %Y"
      end
    end

    # Add new routes here.
  end
end
