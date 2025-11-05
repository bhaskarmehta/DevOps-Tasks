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



TO Run the Automation Script
-----------------------------
1) Create a .sh file Ex - mysql_db_backup.sh
2) chmod +X mysql_db_backup.sh
3) Run the Script as - ./mysql_db_backup.sh

4) If want to run cronjob to run at 2 AM daily -
crontab -e 
0 2 * * * <path of Script>

  
