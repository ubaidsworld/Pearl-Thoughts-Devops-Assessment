# Pearl-Thoughts-Devops-Assessment

# Setup instructions
1. Go to the AWS console and get a free instance ubuntu system.
2. Open the port HTTP 80 in the security groups and 9090 for the prometheus.
3. If you do not have a domain name then use duckdns.org for sudomain.
4. Change the domain name of your choice in the Nginx/yii2 file so that the reverse proxy will setup with the domain.
5. Setup secrets for
   DOCKER_USERNAME = Docker Hub Username,
   DOCKER_PASSWORD = Docker Hub Token,
   EC2_HOST = Public IP of the Instance,
   EC2_SSH_KEY = Pem key of the AWS Key pair copied to the secrets
   and EC2_USER = the user oof the system in my case it will be ubuntu since I am using AWS EC2 with ubuntu.
    
# Assumptions
1. Assumed that the application runs with port 8000.
2. Assumes that the application is not in the same repository.
3. The application is taken from the Yii2 basic example: https://github.com/yiisoft/yii2-app-basic

# How to test deployment
1. Follow the setup instructions mentioned above.
2. Change anything in the repository and the pipeline will start working accordingly.
