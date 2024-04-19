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

## Employment

## Education

## Language skills

<% if cv["language_skills"]["mother_tongues"].length > 1 -%>
mother tongues: <%= cv["language_skills"]["mother_tongues"].join(", ") -%>
<% else -%>
mother tongue: <%= cv["language_skills"]["mother_tongues"].join(", ") -%>
<% end -%>

other language(s):
<% cv["language_skills"]["other_languages"].each do |i| -%>
* <%= i["language"] %>
** certificate: CEFRL <%= i["certificate"]["level"]%> (<%= i["certificate"]["date"]%>)
<% if i["self_assessment"] -%>
** self-assessment: CEFRL <%= i["self_assessment"] %>
<% end -%>
<% end -%>

## Publications
}
puts ERB.new(asciidoc, trim_mode: "-").result(binding)
