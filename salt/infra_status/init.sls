/opt/infrastatus:
  file.directory:
    - user: root
    - group: root
    - mode: 755

/opt/infrastatus/main.py:
  file.managed:
    - source: salt://infra_status/main.py
    - user: root
    - group: root
    - mode: 755

run_script:
  cmd.run:
    - name: python3 /opt/infrastatus/main.py
    - require:
      - file: /opt/infrastatus/main.py
