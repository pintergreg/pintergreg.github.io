# frozen_string_literal: true

require 'ref_parsers'
require 'yaml'
require 'fileutils'

Dir.glob('resources/ris/*.ris') do |ris_file|
  parser = RefParsers::RISParser.new
  ris = parser.open(ris_file)

  FileUtils.mkdir_p('data/ris')
  File.open("data/ris/#{File.basename(ris_file, '.ris')}.yaml", 'w') do |file|
    file.write(YAML.dump(ris[0]))
  end
end
