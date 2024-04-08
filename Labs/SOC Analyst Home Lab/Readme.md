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

## Actions
######
![](img/sl1.png) <br>
######
![](img/sl2.png) <br>
######
![](img/info1.png) <br>
######
![](img/implant4-info.png) <br>
######
![](img/implant4-4.png) <br>
######
![](img/implant4-3.png) <br>
######
![](img/implant4-2.png) <br>
######
![](img/implant4-1.png) <br>
######
![](img/implant4.png) <br>
######
![](img/implant3.png) <br>
######
![](img/implant2.png) <br>
######
![](img/implant1-3.png) <br>
######
![](img/implant1-2.png) <br>
######
![](img/implant1-1.png) <br>
######
![](img/implant1.png) <br>
######
![](img/http.png) <br>
######
![](img/exit.png) <br>
######
![](img/shell.png) <br>
######
![](img/proc.png) <br>
######
![](img/priv-info.png) <br>
######
![](img/priv.png) <br>
######
![](img/netstat.png) <br>
######
![](img/lsass.png) <br>
######
![](img/vs1.png) <br>
######
![](img/vt1.png) <br>
######
![](img/vt2.png) <br>
######
![](img/lcvs.png) <br>
######
![](img/lcvs2.png) <br>
######
![](img/lcvs3.png) <br>
######
![](img/lcvs4.png) <br>
######
![](img/lc11.png) <br>
######
![](img/lc10.png) <br>
######
![](img/lc9.png) <br>
######
![](img/lc8.png) <br>
######
![](img/lc7.png) <br>
######
![](img/lc6.png) <br>
######
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



