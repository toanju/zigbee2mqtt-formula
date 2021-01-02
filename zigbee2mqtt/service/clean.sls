# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import zigbee2mqtt with context %}

zigbee2mqtt-service-clean-service-dead:
  service.dead:
    - name: {{ zigbee2mqtt.service.name }}
    - enable: False
