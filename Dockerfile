FROM jenkins/jenkins:lts

USER root

# Install Docker CLI
RUN apt-get update && apt-get install -y docker.io

# Add Jenkins user to Docker group
RUN groupadd -g 999 docker || true && \
    usermod -aG docker jenkins

USER jenkins
