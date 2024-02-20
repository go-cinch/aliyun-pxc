{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "aliyun-pxc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "aliyun-pxc.fullname" -}}
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
Expand the namespace of the release.
Allows overriding it for multi-namespace deployments in combined charts.
*/}}
{{- define "aliyun-pxc.namespace" -}}
{{- default .Release.Namespace .Values.namespaceOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "aliyun-pxc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "aliyun-pxc.labels" -}}
app.kubernetes.io/name: {{ include "aliyun-pxc.name" . }}
helm.sh/chart: {{ include "aliyun-pxc.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Create the name of the storage class to use
*/}}
{{- define "aliyun-pxc.scName" -}}
	{{ default mysqlsc .Values.storageClass.name }}
{{- end -}}
{{- define "aliyun-pxc.clusterName" -}}
	{{ default mysql-cluster .Values.cluster.name }}
{{- end -}}
{{- define "aliyun-pxc.clusterSize" -}}
	{{ default 5 .Values.cluster.size }}
{{- end -}}
{{- define "aliyun-pxc.clusterIgnoreSb" -}}
	{{ default false .Values.cluster.ignoreSb }}
{{- end -}}
{{- define "aliyun-pxc.clusterIgnoreQuorum" -}}
	{{ default false .Values.cluster.ignoreQuorum }}
{{- end -}}
{{- define "aliyun-pxc.userRoot" -}}
	{{ default root_pwd .Values.user.root }}
{{- end -}}
{{- define "aliyun-pxc.userProxyadmin" -}}
	{{ default proxyadmin_pwd .Values.user.proxyadmin }}
{{- end -}}
{{- define "aliyun-pxc.userOperator" -}}
	{{ default operator_pwd .Values.user.operator }}
{{- end -}}
{{- define "aliyun-pxc.userXtrabackup" -}}
	{{ default backup_pwd .Values.user.xtrabackup }}
{{- end -}}
{{- define "aliyun-pxc.userMonitor" -}}
	{{ default monitor_pwd .Values.user.monitor }}
{{- end -}}
{{- define "aliyun-pxc.userClustercheck" -}}
	{{ default clustercheck_pwd .Values.user.clustercheck }}
{{- end -}}
{{- define "aliyun-pxc.userReplication" -}}
	{{ default replication_pwd .Values.user.replication }}
{{- end -}}
