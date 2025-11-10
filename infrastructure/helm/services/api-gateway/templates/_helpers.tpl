{{/*
Common Helm template helpers for api-gateway
*/}}

{{- define "api-gateway.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{- define "api-gateway.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "api-gateway.labels" -}}
app.kubernetes.io/name: {{ include "api-gateway.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | default .Chart.Version }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "api-gateway.selectorLabels" -}}
app.kubernetes.io/name: {{ include "api-gateway.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "api-gateway.image" -}}
{{ .Values.image.repository }}:{{ .Values.image.tag | default "latest" }}
{{- end -}}
