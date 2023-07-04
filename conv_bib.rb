require "bibtex"
require "yaml"
require "fileutils"

# @attributes = ["author", "title", "journal", "volume", "year", "number", "article-number", "url", "pubmedid", "issn", "abstract", "doi"]

Dir.glob("resources/bibtex/*.bib") do |bibtex|
    FileUtils.mkdir_p("data/bibtex")

    File.open("data/bibtex/#{File.basename(bibtex, ".bib")}.xml", "w") do |file|
        file.write(BibTeX.open(bibtex).to_xml(:extended => true))
    end
end
