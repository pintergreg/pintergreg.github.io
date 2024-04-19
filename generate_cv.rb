require 'erb'
require 'yaml'
require 'date'
require 'toml-rb'

config = TomlRB.parse(File.read('config.toml'))

cv = YAML.load_file('content/cv.md', permitted_classes: [Date, DateTime])
personal = YAML.load_file('data/personal.yaml', permitted_classes: [Date, DateTime])

asciidoc = %{
= <%= config['title'] %>
:icons:

### contact

GitHub: https://github.com/<%= config["Params"]["github"] %> |
GitLab: https://gitlab.com/<%= config["Params"]["gitlab"] %> |
}
puts ERB.new(asciidoc, trim_mode: "-").result(binding)
