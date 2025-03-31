FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y docker.io

COPY basic-security.groovy /usr/share/jenkins/ref/init.groovy.d/basic-security.groovy

# ⚠️ Don't switch back to jenkins user
# USER jenkins  ← ❌ REMOVE this line if it's there
