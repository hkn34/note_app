# Autoload initializers, controllers, helpers, and models
paths = %w[config/initializers/*
           app/**/*.rb
           config/environment/*].map(&:freeze).freeze
paths.each do |path|
  Dir[File.join(NotesApp.root, path)].sort.each do |file|
    require file
  end
end
