[![EmreKybs](https://img.shields.io/badge/MadeBy-EmreKybs-greem)
# AutoMapExec


# AD-SecurityAudit.sh
Purpose: The AD-SecurityAudit.sh script is designed for conducting comprehensive security audits of Active Directory (AD) environments. 
It utilizes a range of tools to assess various aspects of AD security, making it a vital tool for penetration testing and vulnerability assessment in AD domains.

<img src="https://github.com/emrekybs/AutoMapExec/blob/main/1.png">

### Key Features:
* User Input for Domain and DC IP: Collects essential details like the domain name and Domain Controller IP address.
* LDAP Search: Executes LDAP queries targeting service accounts, which are critical for AD security.
* Impacket Tools: Uses GetUserSPNs and GetNPUsers for exploiting Kerberos ticket vulnerabilities and listing users without Kerberos pre-authentication.
* SilentHound and Enum4linux-ng: Advanced Kerberos auditing and comprehensive SMB, user, and system information enumeration.
* RID Brute-Force and NetExec SMB Enumeration: Identifies user accounts and gathers SMB details (users, groups, shares, password policies).
* Zerologon and PetitPotam Attacks: Exploits known vulnerabilities in Windows services for potential unauthorized access.


# AutoMapExec.sh
Purpose: AutoMapExec.sh is an automation script for network mapping and security scanning. 
It integrates various tools to perform an in-depth security assessment of network environments and AD structures.

<img src="https://github.com/emrekybs/AutoMapExec/blob/main/2.png">

### Key Features:
* Domain, DC IP, User Credentials Input: Requests necessary authentication and target information.
* SilentHound and NetExec Commands: Conducts advanced Kerberos auditing and executes various NetExec commands for detailed SMB enumeration.
* CrackMapExec Utilities: Lists computers, local groups, and extracts NTDS using the VSS method.
* Comprehensive SMB Analysis: Includes enumeration of users, groups, shares, sessions, and password policies.
* Zerologon, PetitPotam, and NoPAC Attacks: Attempts exploiting significant vulnerabilities for potential access escalation.
* BloodHound Integration and Remote Desktop Protocol: Utilizes BloodHound for AD analysis and enables RDP on the target machine.
* Execution of Commands and Local Authentication: Executes various commands (like 'whoami', 'quser') and retrieves the SAM database.


# 𝗜𝗡𝗦𝗧𝗔𝗟𝗟𝗔𝗧𝗜𝗢𝗡 𝗜𝗡𝗦𝗧𝗥𝗨𝗖𝗧𝗜𝗢𝗡𝗦
      $ git clone https://github.com/emrekybs/AutoMapExec.git
      $ cd AutoMapExec
      $  chmod +x * && bash install.sh
