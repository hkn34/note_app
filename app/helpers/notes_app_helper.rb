module NotesAppHelper
  def notes_path
    File.expand_path("#{NotesApp.root}/app/views/notes")
  end
end