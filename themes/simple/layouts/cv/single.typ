= Gergő Pintér

== employment

{{- range $.Params.employment }}

=== {{.title}}

- at {{.organization.name}}
{{- range .organization.department }}
    - {{.}}
{{- end }}
- from {{.period.start}}{{- with .period.end }} to {{.}}{{- end }}
{{- end }}

== education


{{- range $index, $element := $.Params.education }}

=== {{.degree.name}}

- {{.organization.name}}, {{.organization.city}}, {{.organization.country}}
{{- if eq $index 0 }}
- EQF #footnote[European Qualifications Framework]<eqf> level: {{.eqf_level}}
{{- else}}
- EQF @eqf level: {{.eqf_level}}
{{- end}}
{{- if eq .eqf_level 8 }}
- dissertation: {{.degree.thesis}}
{{- else }}
- thesis: {{.degree.thesis}}
{{- end }}
{{- end }}

== teaching experience

{{- range $.Site.Data.teaching }}
- {{.title}} ({{.id}})
    - at {{.university}} ({{.from}}--{{ with .to }}{{.}}{{end}})
    - semester: {{.semester}}
    - in {{.language}}
    {{- with .note}}
    - {{.}}
    {{- end}}
{{- end}}

== language skills

{{ "" }}
{{- if gt (len $.Params.language_skills.mother_tongues) 1 }}
*mother tongue(s): {{ delimit $.Params.language_skills.mother_tongues ","}}
{{- else }}
- mother tongue: {{ delimit $.Params.language_skills.mother_tongues ","}}
{{- end }}

{{- if gt (len $.Params.language_skills.other_languages) 1}}
- other language(s):
{{- else }}
- other language:
{{- end }}

{{- range $i, $e := $.Params.language_skills.other_languages }}
    - {{.language}}
        {{- if eq $i 0}}
        - certificate: CEFRL#footnote[Common European Framework of Reference for Languages]<cefrl> {{.certificate.level}} ({{.certificate.date}})
        {{- else}}
        - certificate: CEFRL@cefrl {{.certificate.level}} ({{.certificate.date}})
        {{- end}}
{{- with .self_assessment }}
        - self-assessment: CEFRL@cefrl {{.}}
{{- end }}
{{- end }}

== other certificates

{{ "" }}
{{- with $.Params.other_certificates}}
{{- range . }}
    - {{.name}}
        - level: {{.level}} ({{.date}})
        - organization: {{.organization}}
        - note: {{ delimit .schools ", "}}
{{- end }}
{{- end }}

== awards and honors

{{- range .Site.Data.awards }}
{{- $collaborators := slice}}
{{- range .collaborators}}
{{- $collaborators = $collaborators | append (printf "%s (%s)" .name .affiliation)}}
{{- end}}

- {{.name}} ({{.year}})
    {{/*- description: {{.description}}*/}}
    {{- with .collaborators}}
    - collaborators: {{delimit $collaborators ", " }}
    {{- end}}
{{- end }}
