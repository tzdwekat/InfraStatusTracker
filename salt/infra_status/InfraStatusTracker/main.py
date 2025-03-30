import os
import datetime
import requests

'''
This is a function we could use if we were to upload it internally using python
there are use cases where this is helpful but here well use jenkins post build for version-control and reproducibility 
def upload_to_nexus(file_path):
    #define a function to upload to our repository in nexus
    url = "http://localhost:8081/repository/infra-logs/status.log"
    #use requests library to post (API) our logging file to the nexus repo
    with open(file_path, "rb") as f:
        response = requests.put(
            url,
            data = f,
            auth=("admin", "admin123")
        )
    #output the status code of our response to show if successful
    print("Upload status:", response.status_code)
'''

def check_jenkins_status():
    # Simulate a Jenkins check
    print("✅ Jenkins is running.")

def check_vm_status():
    # Simulate VM check
    print("🖥️  VM is online.")

def log_status():
    now = datetime.datetime.now().isoformat()
    log = f"[{now}] Infra status: OK\n"
    with open("status.log", "a") as f:
        f.write(log)
    print("📄 Status logged.")

if __name__ == "__main__":
    print("Running InfraStatusTracker...")
    check_jenkins_status()
    check_vm_status()
    log_status()
    #log_path = "/opt/infrastatus/status.log"
    #upload_to_nexus(log_path)