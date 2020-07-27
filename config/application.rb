require 'bundler'
require 'ostruct'


Bundler.require(:default, ENV.fetch('RACK_ENV', 'development'))

class NotesApp < Sinatra::Base
  configure do
    SiteConfig = OpenStruct.new(
      title: 'Notes App',
      author: 'Houston Knight',
      url_base: 'http://localhost:9292'
    )

    # Set project root directory
    set :root, File.expand_path('../../',__FILE__)

    # Set project views directory
    set :views, File.join(root, 'app/views')

    # initialiaze sprockets environment
    set :assets, Sprockets::Environment.new(root)

    set :markdown, Redcarpet::Markdown.new(
      Redcarpet::Render::HTML, autolink: true, tables: true)


    # configure assets
    assets.append_path 'app/assets/stylesheets'
    assets.append_path 'app/assets/javascripts'
    assets.js_compressor = Uglifier.new(harmony: true)
    assets.css_compressor = :scss
    get '/app/assets/*' do
      env['PATH_INFO'].sub!('/app/assets', '')
      settings.assets.call(env)
    end
  end
end

require_relative './initializers/autoloader'
