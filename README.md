## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Network Diagram](https://github.com/yesiamapony/Azure-ELK-Stack/blob/main/Images/Network%20Diagram.png?raw=true)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.


Included Files:
- ./Ansible  -Playbook files
- ./Diagrams -Network Diagram
- ./Images   -Extra images
- ./Linux    -Shell scripts


This document contains the following details:

- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


---------- Description of the Topology ---------- 

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting traffic to the network.

Load balancers are used to distribute traffic to multiple obfuscated servers that share the same or similar tasks. This ensures a level of redundancy in the case of a server getting overloaded or completely falling over. 

The advantage of using a jumpbox is that it limits access to the virtual network infrastructure to a single point of entry, that can be locked down to the required level of security. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the filesystem via Filebeat, and system metrics using Metricbeat.

The configuration details of each machine may be found below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux/Ubuntu     |
| WEB-1    | DVWA     | 10.0.0.5   | Linux/Ubuntu     |
| WEB-2    | DVWA     | 10.0.0.6   | Linux/Ubuntu     |
| WEB-3    | DVWA     | 10.0.0.8   | Linux/Ubuntu     |
| ELK      | ELKStack | 10.1.0.4   | Linux/Ubuntu     |


---------- Access Policies ---------- 

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet, and only from your home IP.

Machines within the network can only be accessed by the Ansible Container within the Jump Box VM.

The ELK VM is accessed via SSH from the Ansible Container within the Jump Box VM.
	Jumpbox IP: 10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | [Home IP]            |
| ELK      | No                  | 10.0.0.4             |
| WEB-1    | No                  | 10.0.0.4             |
| WEB-2    | No                  | 10.0.0.4             |
| WEB-3    | No                  | 10.0.0.4             |

---------- Elk Configuration---------- 

Ansible was used to deploy and configure these virtual machines which makes the system scaleable and can be rapidly expanded at ease using Ansible playbooks.

The playbook implements the following tasks:

	* - Download and install Docker
	* - Download and install Docker Module/software
	* - Increase virtual memory
	* - Download and install Docker ELK container
	* - Enable docker on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![docker](https://github.com/yesiamapony/Azure-ELK-Stack/blob/main/Images/docker_ps_output.png)

--------- Target Machines & Beats ---------

This ELK server is configured to monitor the following machines using the Filebeat and Metricbeat

	Web-1: 10.0.0.5 
	Web-2: 10.0.0.6
	Web-3: 10.0.0.7

--------- Filebeat / Metricbeat ---------

Filebeat - Filebeat is a client side agent that can forward log files from monitored locations on the file system that have been specified by the user. For example pushing access logs from an Apache server running on the system Filebeat is installed on. 

Metric Beat - Metric beat is a client side agent that monitors and forwards metrics about the host and services that are installed on that system. For example CPU Load / Memory Usage etc. 



--------- Use of Playbooks ---------

In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:

- Copy the playbook file to the Ansible control node. (via git) 

- Ensure the hosts file lists the correct machine/IP's 

- Run the playbook, and navigate to the receiving VM to check that the installation worked as expected.

The 3 playbook files included are listed below, they need to be copied to the /etc/ansible directory

	Elk setup playbook: ELK-playbook01.yml
	
	DVWA setup playbook: DVWA-playbook.yml
	
	Beats setup playbook: Beats-playbook.yml
	
	
Machines are defined in groups set in the /etc/ansible/hosts file. Playbooks are then set to run on specific groups based on the 'hosts:' header element. The playbook is then executed with the following command.

	> ansible-playbook playbook_filename.yml 

If everything is running correctly you should be able to see Kibana running using the following URL. 
	http://137.135.14.100:5601/app/kibana#/home

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._

	Summary: 
	1) Clone Repo
	2) Copy Playbooks and hostfile to local host
 	3) Execute playbooks

	-----
	git clone https://github.com/yesiamapony/Azure-ELK-Stack.git
	cp ./*.yml /etc/ansible/
	mkdir /etc/ansible/files
	cp ./files/* /etc/ansible/files/
	cp ./hosts /etc/ansible/
	cd /etc/ansible
	ansible-playbook ELK-playbook01.yml
	ansible-playbook Beats-playbook.yml
	ansible-playbook DVWA-playbook.yml
	------
