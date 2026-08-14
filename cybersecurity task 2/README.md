# Task 2 – Basic Firewall Configuration with UFW

## Objective

The objective of this task was to configure a basic firewall on a Linux system using UFW (Uncomplicated Firewall). The firewall was configured to allow and deny specific types of network traffic and the configuration was verified using UFW commands.

## Environment and Tools

- Operating System: Kali Linux
- Virtualization: Oracle VirtualBox
- Firewall: UFW (Uncomplicated Firewall)
- Terminal: Linux Terminal
- Testing Tool: curl
- Python HTTP Server: Python 3

## What is UFW?

UFW (Uncomplicated Firewall) is a command-line firewall management tool for Linux systems. It provides a simpler interface for configuring firewall rules using the underlying Linux firewall framework.

A firewall controls network traffic entering or leaving a system based on predefined rules. It helps reduce unauthorized network access and limits exposure of unnecessary services.

## Why Firewall Configuration Matters

Firewall configuration is important because it:

- Controls incoming and outgoing network traffic.
- Prevents unauthorized access to network services.
- Reduces the attack surface of a system.
- Allows administrators to permit only required services.
- Provides an additional layer of network security.

## Configuration Performed

The UFW firewall was configured with the following default policies:

- Incoming traffic: DENY
- Outgoing traffic: ALLOW

The following firewall rules were configured:

| Port | Service | Action | Purpose |
|------|---------|--------|---------|
| 22/tcp | SSH | ALLOW | Allows SSH connections when required |
| 80/tcp | HTTP | DENY | Blocks incoming HTTP traffic |
| 443/tcp | HTTPS | ALLOW | Allows secure web traffic |
| 21/tcp | FTP | DENY | Blocks incoming FTP traffic |

## Commands Used

### Set Default Policies

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing

Allow SSH
sudo ufw allow ssh

Deny HTTP
sudo ufw deny http

Allow HTTPS
sudo ufw allow https

Deny FTP
sudo ufw deny 21/tcp

Enable UFW
sudo ufw enable

Check Firewall Status
sudo ufw status verbose

Display Numbered Rules
sudo ufw status numbered

Firewall Verification
The final UFW configuration was verified using:
sudo ufw status verbose

The firewall was active and the configured rules were confirmed.

The numbered rule verification showed:

TCP port 22 – ALLOW
TCP port 80 – DENY
TCP port 21 – DENY
TCP port 443 – ALLOW

The IPv6 equivalents of these rules were also configured by UFW.

HTTP Traffic Testing

A temporary Python HTTP server was started on port 80 using:
sudo python3 -m http.server 80 --bind 0.0.0.0

The local Kali VM was then tested using:
curl --connect-timeout 5 http://10.0.2.15:80

The local request successfully reached the Python server.
This local test was not treated as proof that external HTTP traffic was allowed or blocked because the request originated from the same Kali Linux VM.

The firewall configuration was therefore verified separately using:
sudo ufw status numbered

which confirmed that incoming TCP port 80 was explicitly configured as DENY.

Firewall Configuration Script
A shell script named ufw_configuration.sh was created to automate the firewall configuration.

The script performs the following operations:
Sets the default incoming policy to deny.
Sets the default outgoing policy to allow.
Allows SSH traffic.
Denies HTTP traffic.
Allows HTTPS traffic.
Denies FTP traffic.
Enables UFW.
Displays the final firewall status.

The script was made executable using:
chmod +x ufw_configuration.sh

It was executed using:
sudo ./ufw_configuration.sh

The script executed successfully and displayed the firewall status.

Security Analysis
SSH – Port 22
SSH is used for secure remote administration of Linux systems. It was allowed because SSH access may be required for system administration.
However, exposing SSH unnecessarily can increase the risk of brute-force attacks. SSH should be restricted to trusted networks or users when possible.

HTTP – Port 80
HTTP provides unencrypted web communication. It was denied to reduce exposure to unencrypted web traffic.
HTTPS should generally be preferred for web communication because it provides encryption.

HTTPS – Port 443
HTTPS provides encrypted web communication using TLS. It was allowed because secure web traffic is commonly required by modern applications and websites.

FTP – Port 21
FTP is an older file-transfer protocol that does not provide encryption by default. It was denied to reduce unnecessary exposure and security risks.
Secure alternatives such as SFTP can be used when secure file transfer is required.

Screenshots
The following screenshots are included as evidence:-
01_ufw_status.png – Final UFW status and firewall policies
02_ufw_rules.png – Numbered firewall rules
04_ufw_script.png – Successful execution of ufw_configuration.sh

Ethical and Security Considerations
Firewall configuration and network testing should only be performed on systems that you own or have explicit permission to administer.
All testing for this task was performed within a local Kali Linux virtual machine running in VirtualBox.
No external or production systems were targeted.

Conclusion
UFW was successfully configured on Kali Linux with a default-deny incoming policy and default-allow outgoing policy. SSH and HTTPS traffic were allowed, while HTTP and FTP traffic were denied.
The firewall rules were verified using UFW status commands, and a reusable shell script was created to automate the configuration.
This task demonstrated the basic principles of host-based firewall configuration, network traffic control, and security-conscious service exposure.


