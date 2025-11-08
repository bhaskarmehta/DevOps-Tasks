# DevOps-Tasks
DevOps-Tasks


TO Setup Ansible In the Server
----------------------------------
1) apt update
2) apt install ansible -y If  /etc/ansible/hosts and /etc/ansible/ansible.cfg is not created 
3) sudo mkdir -p /etc/ansible
   sudo touch /etc/ansible/ansible.cfg
   sudo touch /etc/ansible/hosts
4) In /etc/ansible/ansible.cfg, add
  [defaults]
  inventory = /etc/ansible/hosts
5) In /etc/ansible/hosts, here we are adding all the servers ip address
  [servers]
  server1 ansible_host=<ip address of host>

***Save the Ansible file name as yaml file - Example - playbook.yaml ****
*** Run the Playbook as  - ansible-playbook playbook.yaml ***

In Destination Server
-------------------
In /etc/ssh/sshd_config file change the parameter to allow the password authentication 

and then run systemctl restart ssh

In ansible server
----------------
Run  - ssh-keygen
And copy the key from source to destination as

ssh-copy-id username@<ip> , Ex - ssh-copy-id root@10.11.0.3




TO Run the Automation Script
-----------------------------
1) Create a .sh file Ex - mysql_db_backup.sh
2) chmod +X mysql_db_backup.sh
3) Run the Script as - ./mysql_db_backup.sh

4) If want to run cronjob to run at 2 AM daily -
crontab -e 
0 2 * * * <path of Script>



  Serverless Architecture Description
  -----------------------------------

###  User Flow
1. **Users** access the application through the Internet.
2. **AWS WAF (Web Application Firewall)** filters and blocks malicious requests (DDoS, SQL injection, etc.).
3. **Amazon CloudFront** acts as a **Content Delivery Network (CDN)** to cache and deliver content globally with low latency.
4. Requests are routed:
   - `/` → to the **S3 Frontend** bucket hosting the static website.
   - `/api` → to the **Amazon API Gateway** for backend processing.
5. **Amazon Cognito** handles user authentication.
6. **AWS Lambda** executes serverless business logic (processing, validation, metadata retrieval).
7. **Amazon DynamoDB** stores and retrieves media metadata .
