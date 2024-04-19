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

GitHub: link:https://github.com/<%= config["Params"]["github"] %>[] |
GitLab: link:https://gitlab.com/<%= config["Params"]["gitlab"] %>[] |
HackerRank: link:https://www.hackerrank.com/profile/<%= config["Params"]["hackerrank"] %>[] |
ORCiD: link:https://orcid.org/<%= config["Params"]["orcid"] %>[] |
Google Scholar: link:https://scholar.google.hu/citations?user=<%= config["Params"]["scholar"] %>[] |
ResearchGate: link:https://www.researchgate.net/profile/<%= config["Params"]["researchgate"] %>[] |
LinkedIn: link:https://www.linkedin.com/in/<%= config["Params"]["linkedin"] %>[] |
Twitter: link:https://twitter.com/<%= config["Params"]["twitter"] %>[] |

}
puts ERB.new(asciidoc, trim_mode: "-").result(binding)
