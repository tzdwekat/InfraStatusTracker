FROM jenkins/jenkins:lts

USER root

# Install Docker CLI
RUN apt-get update && apt-get install -y docker.io

# Add Jenkins user to Docker group
RUN groupadd -g 998 docker || true && usermod -aG docker jenkins

USER jenkins

# Copy plugins.txt and install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt
