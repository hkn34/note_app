class Note
  include NotesAppHelper
  attr_accessor :dir, :filename, :ext

  def initialize(dir, filename, ext, content)
    @dir = dir
    @filename = filename
    @ext = ext
    @content = content
  end

  def save
    File.open("#{notes_path}/#{@dir}/#{@filename}", 'w+') do |file|
      file.write(content)
    end
  end

  def self.find(dir, filename)
    File.new(dir, filename, )
  end
end