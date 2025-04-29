{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "restack.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "restack.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "restack.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "restack.labels" -}}
helm.sh/chart: {{ include "restack.chart" . }}
{{ include "restack.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "restack.selectorLabels" -}}
app.kubernetes.io/name: {{ include "restack.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Backend deployment labels
*/}}
{{- define "restack.backendLabels" -}}
helm.sh/chart: {{ include "restack.chart" . }}
{{ include "restack.backendSelectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Backend selector labels
*/}}
{{- define "restack.backendSelectorLabels" -}}
app.kubernetes.io/name: {{ include "restack.name" . }}-backend
app.kubernetes.io/instance: {{ .Release.Name }}-backend
{{- end -}}

{{- define "restack.streamLabels" -}}
helm.sh/chart: {{ include "restack.chart" . }}
{{ include "restack.streamSelectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Stream selector labels
*/}}
{{- define "restack.streamSelectorLabels" -}}
app.kubernetes.io/name: {{ include "restack.name" . }}-stream
app.kubernetes.io/instance: {{ .Release.Name }}-stream
{{- end -}}

{{/*
Pipeline deployment labels
*/}}
{{- define "restack.pipelineLabels" -}}
helm.sh/chart: {{ include "restack.chart" . }}
{{ include "restack.pipelineSelectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Pipeline selector labels
*/}}
{{- define "restack.pipelineSelectorLabels" -}}
app.kubernetes.io/name: {{ include "restack.name" . }}-pipeline
app.kubernetes.io/instance: {{ .Release.Name }}-pipeline
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "restack.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "restack.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}
