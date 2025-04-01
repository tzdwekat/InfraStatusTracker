#!/bin/bash
# Wait for Jenkins to be ready
until curl -s http://jenkins:8080/login > /dev/null; do
  echo "Waiting for Jenkins..."
  sleep 5
done

# Define your job configuration XML (customize as needed)
JOB_XML=$(cat <<EOF
<flow-definition plugin="workflow-job">
  <description>InfraStatusTracker Pipeline</description>
  <keepDependencies>false</keepDependencies>
  <definition class="org.jenkinsci.plugins.workflow.cps.CpsFlowDefinition" plugin="workflow-cps">
    <script>
      pipeline {
        agent any
        stages {
          stage('Build') {
            steps {
              echo 'Building...'
            }
          }
        }
      }
    </script>
    <sandbox>true</sandbox>
  </definition>
  <triggers/>
</flow-definition>
EOF
)

# Create the job via the Jenkins API
curl -X POST "http://jenkins:8080/createItem?name=InfraStatusTracker" \
  --data-binary "$JOB_XML" \
  -H "Content-Type: application/xml" \
  --user admin:admin123
