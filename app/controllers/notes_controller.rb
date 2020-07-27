require_relative '../helpers/notes_app_helper'
# require 'redcarpet/compat'
class NotesController < ApplicationController
  include NotesAppHelper
  # show note
  get "/:dir/:file" do
    logger.info "Woah #{NotesApp.markdown}"
    # Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    dir = params[:dir]
    file = params[:file]
    note = Dir["#{notes_path}/#{dir}/#{file}*"].first
    erb :note_template do
      if note.include?('.md')
        Markdown.new(File.read(note)).to_html
      else
        File.read(note)
      end
    end
  end
end