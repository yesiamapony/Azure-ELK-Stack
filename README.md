## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.
!(Diagrams/Network Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

This document contains the following details:

- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting traffic to the network.

_TODO: What aspect of security do load balancers protect? What is the advantage of a jump box?:

	Load balancers are used to distribute load to multiple obfuscated servers that share the same/similar tasks. This ensures that there exists some redundancy in the case of a server getting overloaded or completely falling over. 

	The advantage of using a jumpbox is that it limits access to the virtual network infrastructure to a single point of entry, that can be locked down to the required level of security. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the filesystem and system metrics.

Changes to the local file system is handled by Filebeat and Metricbeat records system and services metrics.  

The configuration details of each machine may be found below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux/Ubuntu     |
| WEB-1    | DVWA     | 10.0.0.5   | Linux/Ubuntu     |
| WEB-2    | DVWA     | 10.0.0.6   | Linux/Ubuntu     |
| WEB-3    | DVWA     | 10.0.0.8   | Linux/Ubuntu     |
| ELK      | ELKSTACK | 10.1.0.4   | Linux/Ubuntu     |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses: 
	
	HOME IP ADDRESS (xxx.xxx.xxx.xxx) - Hidden	

Machines within the network can only be accessed by the Ansible Container within the Jump Box VM

Which machine did you allow to access your ELK VM? What was its IP address?

	ELK VM is accessed via SSH from the Ansible Container within the Jump Box VM.
		Jumpbox IP: 10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | [Home IP]            |
| ELK      | No                  | 10.0.0.4             |
| WEB-1    | No                  | 10.0.0.4             |
| WEB-2    | No                  | 10.0.0.4             |
| WEB-3    | No                  | 10.0.0.4             |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...

What is the main advantage of automating configuration with Ansible?

	The main advantage of using Ansible is scalability, as any further virtual machines that need provisioning/configuration can be rapidly set up via playbooks. 

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
	
	* - Download and install Docker
	* - Download and install Docker Module/software
	* - Increase virtual memory
	* - Download and install Docker ELK container
	* - Enable docker on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output]
	(Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines

	10.0.0.5, 10.0.0.6, 10.0.0.8


We have installed the following Beats on these machines:

	10.0.0.5, 10.0.0.6, 10.0.0.8


The beats that were installed were:
	
	Filebeat & Metricbeat

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._
	
	Filebeat - Filebeat is a client side agent that can forward log files from monitored locations on the file system that have been specified by the user. For example pushing access logs from an Apache server running on the system Filebeat is installed on. 

	Metric Beat - Metric beat is a client side agent that monitors and forwards metrics about the host and services that are installed on that system. For example CPU Load / Memory Usage etc. 

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:

- Copy the playbooks file to the Ansible control node.

- Update the hosts file to include the IP addresses of the machines the playbook is to be run on. 

- Run the playbook, and navigate to the receiving VM to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_

- _Which file is the playbook? Where do you copy it?_
	Elk setup playbook: ELK-playbook01.yml 
	DVWA setup playbook: DVWA-playbook.yml
	Beats setup playbook: Beats-playbook.yml

	Copy to the /etc/ansible/ directory

- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_

	Machines are defined in groups set in the /etc/ansible/hosts file. Playbooks are then set to run on specific groups based on the 'hosts:' header element. Then playbook is executed with the following command.

	>	ansible-playbook playbook.yml 


- _Which URL do you navigate to in order to check that the ELK server is running?
	
	http://137.135.14.100:5601/app/kibana#/home

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._

	Summary: 
	1) Clone Repo
	2) Copy Playbooks and hostfile to local host
 	3) Execute playbooks

	-----
	Git clone repo containing project files
	cp ./*.yml /etc/ansible/
	mkdir /etc/ansible/files
	cp ./files/* /etc/ansible/files/
	cp ./hosts /etc/ansible/
	cd /etc/ansible
	ansible-playbook ELK-playbook01.yml
	ansible-playbook Beats-playbook.yml
	ansible-playbook DVWA-playbook.yml
	------
