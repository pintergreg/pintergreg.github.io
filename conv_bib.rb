require "bibtex"
require "yaml"
require "fileutils"
require "citeproc"

# @attributes = ["author", "title", "journal", "volume", "year", "number", "article-number", "url", "pubmedid", "issn", "abstract", "doi"]

Dir.glob("resources/bibtex/*.bib") do |bibtex|
    cp = CiteProc::Processor.new style: "ieee", format: "text"
    cp.import BibTeX.open(bibtex).to_citeproc
    p BibTeX.open(bibtex).to_json

    id = "pinter2022commuting"
    if cp.items.include? id
    p cp.items[id]["title"].to_s
    p cp.items[id].to_h
    p cp.items[id]["author"][0]["family"]
    p cp.items[id]["journal"]
    else
        puts "."
    end
    # record = {}
    # @attributes.each do |a|
        # record[a] = cp.items[File.basename(bibtex, ".bib")].read_attribute(a)
    # end
    FileUtils.mkdir_p("data/bibtex")

    File.open("data/bibtex/#{File.basename(bibtex, ".bib")}.json", "w") do |file|
        file.write(BibTeX.open(bibtex)[0].to_json)
    end
    File.open("data/bibtex/#{File.basename(bibtex, ".bib")}_b.yaml", "w") do |file|
        file.write(BibTeX.open(bibtex)[0].to_yaml(:extended => true))
    end
    File.open("data/bibtex/#{File.basename(bibtex, ".bib")}.xml", "w") do |file|
        file.write(BibTeX.open(bibtex).to_xml(:extended => true))
    end


    File.open("data/bibtex/#{File.basename(bibtex, ".bib")}.yaml", "w") do |file|
        file.write(YAML.dump(cp.items[File.basename(bibtex, ".bib")].to_citeproc))
    end
end
