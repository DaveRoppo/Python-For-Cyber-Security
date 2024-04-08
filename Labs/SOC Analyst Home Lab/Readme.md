# SOC Analyst Home Lab
### Acknowledgements
The following home lab configuration and accompanying exercises were inspired by Eric Capuano's blog series:
[So you want to be a SOC Analyst?](https://blog.ecapuano.com/p/so-you-want-to-be-a-soc-analyst-intro?sd=pf)

## Objectives
- Deploy and configure lab enviroment with an Ubuntu Server VM (attacker) and a vulnerable Windows 11 VM (Victim) using VMWare Workstation Pro
- Install LimaCharlie EDR agent on our victim endpoint (Windows 11)
- Generate attack telemetry using offensicve tools such as Sliver C2 on Ubuntu Server 
- Observe Windows 11 telemetry in LimaCharlie EDR web interface
- Craft and tune detection & response rules to alert on and respond to malicious activity

## Lab Environment 
- VMWare Workstation Pro
- Ubuntu Server 22.04.1 (Attacker) 14GB Disk size 2 CPU cores 2GB RAM
- Windows 11 Eval (Victim)
## Tools Used
### Offensive Toolset
- Sliver C2
### Defensive Toolset
- LimaCharlie EDR
- Sigma
- Sysmon
- Yara
#### Threat Intelligence
- EchoTrail
- VirusTotal
- Mitre ATT&CK

## Part 1: Generating C2 Telemetry
###### Running Sliver Server on our Ubuntu Vm
![](img/sl2.png) <br>
###### Generating and verifying our Sliver C2 payload on the Ubuntu Vm 
![](img/implant4-1.png) <br>
###### Starting a HTTP listener using Sliver on the Ubuntu VM
![](img/implant4-4.png) <br>
###### Running our C2 Payload (READY_GONG.exe) on the victim Windows host
![](img/implant4-3.png) <br>
###### Starting a Shell using our Sliver C2 payload
![](img/exit.png) <br>
###### Running commands (info, whoami, etc.) using our C2 Connection
![](img/info1.png) <br>
###### Running commands (info, whoami, etc.) using our C2 Connection
![](img/implant4-info.png) <br>
###### Using our shell to view our permissions on our compromised Windows VM
![](img/proc.png) <br>
###### Using our shell to view privledges on our compromised Windows host
![](img/priv.png) <br>
###### Using our shell to view network connections on our compromised Windows VM with netstat
![](img/netstat.png) <br>
###### Process Tree on our compromised Windows VM
![](img/shell.png) <br>
###### Viewing sensitive process access in the LimaCharlie timeline displaying our C2 payload being executed
![](img/lc10.png) <br>
###### Viewing sensitive process access in the LimaCharlie timeline displaying our C2 payload being executed
![](img/lc9.png) <br>
###### Viewing network connections in the LimaCharlie timeline displaying our C2 payload being executed
![](img/lc8.png) <br>
###### Viewing new processes in the LimaCharlie timeline displaying our C2 payload being executed
![](img/lc7.png) <br>
###### Viewing new documents in LimaCharlie showing our C2 Payload
![](img/lc6.png) <br>
###### Viewing our compromised Windows host's Downloads folder displaying our C2 payload
![](img/lc5.png) <br>
###### Viewing suspicious network connections in LimaCharlie
![](img/lc4.png) <br>
###### LimaCharlie displaying our network connection with the attacking Ubuntu VM
![](img/lc3.png) <br>
###### Drilling down on network connections for the suspicious process on our Windows VM
![](img/lc2.png) <br>
###### Viewing running processes on our infected host using LimaCharlie
![](img/lc1.png) <br>
###### Using the VirusTotal intergration on LimaCharlie to search the hash of our C2 Payload
![](img/vt1.png) <br>
###### VirusTotl showing no results for the C2 payload doesn't mean we're in the clear!
![](img/vt2.png) <br>

## Part 2: Crafting Detection Rules
###### Viewing the timeline in LimaCharlie displaying our C2 payload being executed
![](img/lsass.png) <br>
###### Crafing our detection rule for LSASS access
![](img/dr1.png) <br>
###### Testing our detection rule for LSASS access
![](img/dr2.png) <br>
###### Saving our detection rule for LSASS access
![](img/dr3.png) <br>
###### Our LSASS acess detection rule firing in LimaCharlie
![](img/lc11.png) <br>

## Part 3: Crafting Response Rules
###### running "vssadmin delete shadows /all" on our compromised Windows VM (Typical during ransomware infections)
![](img/vs1.png) <br>
###### LimaCharlie timeline showing the deletion of shadow copies command being run
![](img/lcvs3.png) <br>
###### LimaCharlie shadow copies deletion detection displaying references for a pre-built Sigma rule
![](img/lcvs4.png) <br>
###### Crafting our own detection and response rule for shadow copy deletion
![](img/drvs.png) <br>
###### Testing our detection and response rule for shadow copy deletion
![](img/drvs2.png) <br>
###### Saving our detection and response rule for shadow copy deletion
![](img/drvs3.png) <br>
###### LimaCharlie detection rule firing following the deletion of shadow copies on our compromised host
![](img/lcvs.png) <br>
###### LimaCharlie detection rule firing following the deletion of shadow copies on our compromised host
![](img/lcvs2.png) <br>
###### LimaCharlie response rule blocking our actions
![](img/http.png) <br>

## Part 4: Tuning False Positives
###### Crafting a detection rule for suspicious svchost execution
![](img/svc6.png) <br>
###### Our detections tab in LimaCharlie flooded with false positives 
![](img/svc.png) <br>
###### Viewing one of our false positives generated by our suspicious svchost execution detection rule
![](img/svc4.png) <br>
###### Viewing our svchost detection rule in preparation for tuning the false positive
![](img/svc5.png) <br>
###### Tuning our suspicious svchost detection rule
![](img/svc2.png) <br>
###### Testing our tuned detection rule with success!
![](img/svc3.png) <br>

## Part 5: Yara Scanning
###### Crafting our Sliver YARA rule (courtesy of NSSC UK)
![](img/yara-rule6.png) <br>
###### Crafting our YARA detection rule so we can be alerted of our of YARA findings
![](img/yara-rule4.png) <br>
###### Crafting our Sliver-Process YARA rule (courtesy of NSSC UK & Eric Capuano)
![](img/yara-rule5.png) <br>
###### Crafting our YARA detection in memory rule so we can be alerted of our of YARA findings
![](img/yara-rule3.png) <br>
###### Testing our YARA rule
![](img/console2.png) <br>
###### Confirmation that our YARA rule picked up our Sliver payload 
![](img/console.png) <br>
###### Automating our YARA scan for processes launched from our Downloads folder
![](img/yara-rule1.png) <br>
###### Automating our YARA scan for executables that are downloaded to our Downloads folder
![](img/yara-rule2.png) <br>
###### Our YARA detection firing after the executable is dropped in our Downloads folder
![](img/yara-dr.png) <br>
###### Our YARA detection firing after the executable is launched from our Downloads folder
![](img/yara-mem.png) <br>

