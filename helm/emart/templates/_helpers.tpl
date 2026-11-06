{{/*
Common labels for resource metadata.
Selectors keep the original "app: <name>" label only, since Deployment selectors are immutable.
*/}}
{{- define "emart.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" }}
app.kubernetes.io/part-of: {{ .Chart.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- with .Values.commonLabels }}
{{ toYaml . }}
{{- end }}
{{- end }}

{{/*
Full image reference: repository:tag
*/}}
{{- define "emart.image" -}}
{{ printf "%s:%s" .repository (toString .tag) }}
{{- end }}
