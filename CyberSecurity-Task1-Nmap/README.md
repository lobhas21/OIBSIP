# Task 1 — Basic Network Scanning with Nmap

## Objective

Perform a basic network security scan on a local Kali Linux virtual machine using Nmap to identify accessible ports, services, service versions, and operating-system information.

## Tools Used

* Kali Linux
* Oracle VirtualBox
* Nmap 7.99
* Linux Terminal
* Python 3.13.12 for a temporary local HTTP service

## What is Nmap?

Nmap (Network Mapper) is a network scanning and security auditing tool. It can discover hosts, identify open ports, detect running services and their versions, and attempt operating-system detection.

## Why Network Scanning Matters

Network scanning helps system administrators and security professionals understand which services are accessible on a system. It can help identify unnecessary network exposure, support security auditing, and improve system security.

## Target

The scans were performed against a Kali Linux virtual machine running locally in VirtualBox.

**Target IP:** `10.0.2.15`

## Scans Performed

### 1. Basic Scan

```bash
nmap 10.0.2.15
```

This scan checks commonly used TCP ports and reports their state.

### 2. Service Version Detection

```bash
nmap -sV 10.0.2.15
```

The `-sV` option attempts to identify services and their software versions on accessible open ports.

### 3. Operating System Detection

```bash
nmap -O 10.0.2.15
```

The `-O` option attempts to identify the operating system of the target.

## Controlled Local Service Test

The initial scans did not identify an open service. Therefore, a temporary Python HTTP server was started on the local Kali virtual machine to demonstrate service and port detection.

```bash
python3 -m http.server 8000 --bind 0.0.0.0
```

Port 8000 was then scanned using:

```bash
nmap -p 8000 10.0.2.15
```

Service and version detection was performed using:

```bash
nmap -sV -p 8000 10.0.2.15
```

Nmap identified the temporary service as:

**Port:** `8000/tcp`
**Service:** HTTP
**Software:** `SimpleHTTPServer 0.6`
**Python:** `3.13.12`

The temporary HTTP server was stopped after testing.

> **Note:** Port 8000 was intentionally opened for this controlled test. It was not reported as open in the original default 1000-port scan.

## Results

The detailed Nmap findings and security analysis are documented separately in:

`nmap_scan_results.txt`

Screenshots of the Nmap commands and their outputs are included in the project repository.

## Security Considerations

Open network ports can increase a system's attack surface because they may provide access to network services.

The temporary HTTP service on port 8000 was used only for testing. Unnecessary services should be stopped, and required services should be restricted using appropriate firewall and network-access controls.

## Ethical Use Guidelines

Nmap must only be used on systems that you own or have explicit permission to scan.

Unauthorized scanning of external, production, or third-party systems may violate organizational policies or applicable laws.

For this task, all scanning was performed against a locally controlled Kali Linux virtual machine.

## Conclusion

This task demonstrated the use of Nmap for basic network discovery, service and version detection, and operating-system detection. A temporary local HTTP service was also used to demonstrate how Nmap identifies an open port and running service.

The exercise highlights the importance of understanding exposed network services and limiting unnecessary network exposure.
