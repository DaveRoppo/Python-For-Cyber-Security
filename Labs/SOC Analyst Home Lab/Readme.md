# SOC Analyst Home Lab (In Progess)
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
## Part 2: Crafting Detection Rules
## Part 2: Crafting Response Rules
## Part 4: Tuning False Positives
## Part 5: Yara Scanning
###### Running Sliver Server on our Ubuntu Vm
![](img/sl1.png) <br>
###### Running Sliver Server on our Ubuntu Vm
![](img/sl2.png) <br>
###### Running commands (info, whoami, etc.) using our C2 Connection
![](img/info1.png) <br>
###### Running commands (info, whoami, etc.) using our C2 Connection
![](img/implant4-info.png) <br>
###### Starting a HTTP listener using Sliver on the Ubuntu VM (READY)
![](img/implant4-4.png) <br>
###### Running our C2 Payload (READY_GONG.exe) on the victim Windows host
![](img/implant4-3.png) <br>
###### Generating and verifying our Sliver C2 payload on the Ubuntu Vm (READY)
![](img/implant4-2.png) <br>
###### Delete
![](img/implant4-1.png) <br>
###### Delete
![](img/implant4.png) <br>
###### Delete
![](img/implant3.png) <br>
###### Starting a HTTP listener using Sliver on the Ubuntu VM (FIT)
![](img/implant2.png) <br>
###### Running our C2 Payload (READY_GONG.exe) on the victim Windows host (FIT)
![](img/implant1-3.png) <br>
###### Generating and verifying our Sliver C2 payload on the Ubuntu Vm (FIT)
![](img/implant1-2.png) <br>
###### Delete
![](img/implant1-1.png) <br>
###### Starting a HTTP listener using Sliver on the Ubuntu VM (FIT)
![](img/implant1.png) <br>
###### LimaCharlie response rule blocking our actions
![](img/http.png) <br>
###### Starting a Shell using our Sliver C2 payload
![](img/exit.png) <br>
###### Process Tree on our compromised Windows VM
![](img/shell.png) <br>
###### Using our shell to view our permissions on our compromised Windows VM
![](img/proc.png) <br>
###### Delete
![](img/priv-info.png) <br>
###### Using our shell to view running processes on our compromised Windows VM
![](img/priv.png) <br>
###### Viewing the timeline in LimaCharlie displaying our C2 payload being executed
![](img/netstat.png) <br>
###### Running "vssadmin delete shadows /all" on our compromised Windows VM (Typical during ransomware infections)
![](img/lsass.png) <br>
###### Using the VirusTotal intergration on LimaCharlie to search the hash of our C2 Payload
![](img/vs1.png) <br>
###### VirusTotl showing no results for the C2 payload doesn't mean we're in the clear!
![](img/vt1.png) <br>
###### LimaCharlie detection rule firing following the deletion of shadow copies on our compromised host
![](img/vt2.png) <br>
###### LimaCharlie detection rule firing following the deletion of shadow copies on our compromised host
![](img/lcvs.png) <br>
###### LimaCharlie timeline showing the deletion of shadow copies command being run
![](img/lcvs2.png) <br>
###### LimaCharlie shadow copies deletion detection displaying references for the rule
![](img/lcvs3.png) <br>
###### Our LSASS acess detection rule firing in LimaCharlie
![](img/lcvs4.png) <br>
###### Viewing the timeline in LimaCharlie displaying our C2 payload being executed
![](img/lc11.png) <br>
###### Viewing sensitive process access in the LimaCharlie timeline displaying our C2 payload being executed
![](img/lc10.png) <br>
###### Viewing network connections in the LimaCharlie timeline displaying our C2 payload being executed
![](img/lc9.png) <br>
###### Viewing new processes in the LimaCharlie timeline displaying our C2 payload being executed
![](img/lc8.png) <br>
###### Viewing our compromised Windows host's Downloads folder displaying our C2 payload
![](img/lc7.png) <br>
###### Viewing suspicious network connections in LimaCharlie
![](img/lc6.png) <br>
###### Viewing suspicious network connections in LimaCharlie showing our C2 payload
![](img/lc5.png) <br>
######
![](img/lc4.png) <br>
######
![](img/lc3.png) <br>
######
![](img/lc2.png) <br>
######
![](img/lc1.png) <br>
######
![](img/drvs3.png) <br>
######
![](img/drvs2.png) <br>
######
![](img/drvs.png) <br>
######
![](img/dr3.png) <br>
######
![](img/dr2.png) <br>
######
![](img/dr1.png) <br>
######
![](console.png) <br>
######
![](console2.png) <br>
######
![](svc.png) <br>
######
![](svc2.png) <br>
######
![](svc3.png) <br>
######
![](svc4.png) <br>
######
![](svc5.png) <br>
######
![](svc6.png) <br>
######
![](yara-mem.png) <br>
######
![](yara-dr.png) <br>
######
![](yara-rule1.png) <br>
######
![](yara-rule2.png) <br>
######
![](yara-rule3.png) <br>
######
![](yara-rule4.png) <br>
######
![](yara-rule5.png) <br>
######
![](yara-rule6.png) <br>



