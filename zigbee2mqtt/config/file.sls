# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_package_install = tplroot ~ '.package.install' %}
{%- from tplroot ~ "/map.jinja" import zigbee2mqtt with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

include:
  - {{ sls_package_install }}

zigbee2mqtt-config-file-file-managed:
  file.managed:
    - name: {{ zigbee2mqtt.config }}
    - source: {{ files_switch(['example.tmpl'],
                              lookup='zigbee2mqtt-config-file-file-managed'
                 )
              }}
    - mode: 644
    - user: root
    - group: {{ zigbee2mqtt.rootgroup }}
    - makedirs: True
    - template: jinja
    - require:
      - sls: {{ sls_package_install }}
    - context:
        zigbee2mqtt: {{ zigbee2mqtt | json }}
