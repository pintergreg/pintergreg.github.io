# frozen_string_literal: true

require 'erb'
require 'yaml'
require 'date'
require 'toml-rb'
require 'fileutils'

config = TomlRB.parse(File.read('config.toml'))

if File.exist? 'data/personal.yaml'
  personal = YAML.load_file('data/personal.yaml', permitted_classes: [Date, DateTime])
end

contact = false
asciidoc = %(
= <%= config['title'] %>
:pdf-theme: cv_template.yml
:icons:
:iconsdir: static/icons
:icontype: svg
:hide-uri-scheme:

<% if personal %>
[.normal]
date of birth: <%= personal["date_of_birth"] %> |
nationality: <%= personal["nationality"] %> |
phone number: <%= personal["phone"] %> |
email address: <%= personal["email"]["professional"] %> |
website: link:https://pintergreg.github.io[] |
address: <%= personal["address"] %>
<% end %>

<% if contact %>
== contact

link:https://github.com/<%= config["Params"]["github"] %>[icon:github[],title=GitHub] |
link:https://gitlab.com/<%= config["Params"]["gitlab"] %>[icon:gitlab[],title=GitLab] |
link:https://www.hackerrank.com/profile/<%= config["Params"]["hackerrank"] %>[icon:hackerrank[],title=HackerRank] |
link:https://orcid.org/<%= config["Params"]["orcid"] %>[icon:orcid[],title=ORCiD] |
link:https://scholar.google.hu/citations?user=<%= config["Params"]["scholar"] %>[icon:google-scholar[],title=Google Scholar] |
link:https://www.researchgate.net/profile/<%= config["Params"]["researchgate"] %>[icon:researchgate[],title=ResearchGate] |
link:https://www.linkedin.com/in/<%= config["Params"]["linkedin"] %>[icon:linkedin[],title=LinkedIn] |
link:https://twitter.com/<%= config["Params"]["twitter"] %>[icon:twitter[],title=Twitter]
<% end %>

)
asciidoc += File.read('public/cv/index.asciidoc')
asciidoc += "\n\n<<< \n\n"
asciidoc += File.read('public/publications/index.asciidoc')
asciidoc += "\n"

File.open('cv.asciidoc', 'w') do |file|
  file.write(ERB.new(asciidoc, trim_mode: '-').result(binding))
end

`asciidoctor-pdf cv.asciidoc`

if Dir.exist?('public') && File.exist?('cv.pdf')
  FileUtils.cp('cv.pdf', 'public/')
else
  warn 'cv.pdf or public directory does not exist'
end
