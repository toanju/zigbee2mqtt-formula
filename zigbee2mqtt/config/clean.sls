# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_service_clean = tplroot ~ '.service.clean' %}
{%- from tplroot ~ "/map.jinja" import zigbee2mqtt with context %}

include:
  - {{ sls_service_clean }}

zigbee2mqtt-config-clean-file-absent:
  file.absent:
    - name: {{ zigbee2mqtt.config }}
    - require:
      - sls: {{ sls_service_clean }}
