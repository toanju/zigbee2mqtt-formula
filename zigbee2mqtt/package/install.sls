# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import zigbee2mqtt with context %}

zigbee2mqtt-package-install-pkg-installed:
  pkg.installed:
    - name: {{ zigbee2mqtt.pkg.name }}
