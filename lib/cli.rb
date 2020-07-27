require 'optparse'

module NotesApp
  class Cli
    options = {}

    optparse = OptionParser.new do |opts|

      opts.banner = "Usage: #{File.basename($PROGRAM_NAME)} [OPTIONS]..."

      opts.on('-a', '--add [NOTE]', '| Add new note and open in default text editor.') do
        options[:add]
      end
      opts.on('-d', '--directory [DIR]', '| Specify a directory to place note in.') do
        options[:directory]
      end
      opts.on('-e', '--edit [NOTE]', '| Open existing note in default text editor.') do
        options[:edit]
      end
      opts.on('-f', '--force', '| Do not prompt before action. Applies to moving, updating, and removing notes.') do
        options[:force]
      end
      opts.on('-l', '--list', '| List all existing notes.') do
        options[:list]
      end
      opts.on('-n', '--name [OLD_NAME] [NEW_NAME]', '| Rename existing note.') do
        options[:name]
      end
      opts.on('-o', '--open [NOTE]', '| Open note in browser window.') do
        options[:open]
      end
      opts.on('-r', '--remove [NOTE]', '| Remove note.') do
        options[:rename]
      end
      opts.on('-h', '--help', '| Print this help menu.') do
        puts opts
        puts ""
        puts "\tWhen command is run without any options passed, a web browser window opens"
        puts "\tto a navigational home screen. Everything is fully adminable from both"
        puts "\tCLI and browser."
        exit
      end
    end

    optparse.parse!
    put optparse.empty?
  end
end