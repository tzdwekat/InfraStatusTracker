/opt/infrastatus:
 file.recurse:
 - source: salt://InfraStatusTracker
 - makedirs: True

infra_script:
 cmd.run:
 - name: python3 /opt/infrastatus/main.py
 - require:
 - file: /opt/infrastatus