require_relative '../helpers/notes_app_helper'
class ApplicationController < NotesApp
  use Rack::Logger
  include NotesAppHelper

  # Route to home page
  get '/' do
    @notes = {}
    @notes_path = notes_path
    Dir["#{notes_path}/*/*"].map { |note| note.split("/")[-2..-1] }.each do |x|
      if @notes[x[0]].nil?
        @notes[x[0]] = [x[1]]
      else
        @notes[x[0]] << x[1]
      end
    end
    erb :index
  end
end
