#encoding: utf-8
# Use the app.rb file to load Ruby code, modify or extend the models, or
# do whatever else you fancy when the theme is loaded.

require 'i18n'
require 'i18n/backend/fallbacks'
require 'json'

module Rack
  class Codehighlighter
    def coderay(string)
      lang = 'unknown'
      refs = @opts[:pattern].match(string)  # extract language name
      if refs
        opts = {:line_numbers => :inline}
        lang = refs[1]
        str = unescape_html(string.sub(@opts[:pattern], ""))
        "<pre class='CodeRay'>#{::CodeRay.encoder(:html).encode str, lang, opts}</pre>"
      else
        "<pre class='CodeRay'>#{string}</pre>"
      end
    end
  end
end

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

      def sub_menu_items(level = 1)
        ancestors = []
        page = @page
        while page
          ancestors << page
          page = page.parent
        end
        if ancestors.length <= level
          return []
        end
        menu = Nesta::Menu.for_path(ancestors.reverse[level].abspath)
        menu.shift
        menu.flatten(1)
      end

      def articles_heading
        @page.metadata('articles heading') || "Artiklar i #{@page.heading}"
      end
    end

    # Add new routes here.
    post '/api/github-update-hook' do
      content_type 'application/json'
      # Github IP block: 192.30.252.0/22
      return JSON.generate({:error => 'POST variable "payload" missings'}) if params[:payload].nil?
      begin
        payload = JSON.parse(params[:payload])
      rescue
        return JSON.generate({:error => 'Failed to parse payload'})
      end
      cmd = 'cd %s && git reset --hard origin/master' % Nesta::Config.content
      if payload['ref'] == 'refs/heads/master' and system(cmd)
        JSON.generate({:result => 'Updated content'})
      else
        JSON.generate({:error => 'Master branch not updated'})
      end
    end
  end

  class Page
    def read_more
      metadata('read more') || 'Läs mer'
    end
  end

  module Navigation
    module Renderers
      def breadcrumb_label(page)
        (page.abspath == '/') ? 'Hem' : page.heading
      end
    end
  end
end
