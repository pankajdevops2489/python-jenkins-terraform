{{/* Create a default fully qualified name for resources */}}
{{- define "python-app-chart.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name }}
{{- end -}}
