[![EmreKybs](https://img.shields.io/badge/MadeBy-Angelus-greem)
# AD-AssessmentKit
These tools are ideal for network administrators and cybersecurity professionals seeking to assess and enhance the security posture of AD environments and network infrastructures.

# AD-SecurityAudit.sh
Focuses on initial reconnaissance and vulnerability identification in AD domains, requiring only the domain name and Domain Controller IP address.

<img src="https://github.com/emrekybs/AutoMapExec/blob/main/1.png">

### Key Features:
* LDAP and Service Account Queries: Conducts LDAP searches targeting service accounts in the AD.
* Kerberos Ticket Analysis: Uses Impacket's tools for analyzing Kerberos ticket vulnerabilities and identifying accounts without pre-authentication
* Comprehensive Kerberos and SMB Enumeration: Employs SilentHound and Enum4linux-ng for Kerberos auditing and detailed SMB, user, and system information scanning.
* Enumeration Techniques: Implements RID brute-force and NetExec SMB enumeration for discovering user accounts, groups, and security policies.
* Exploitation of Windows Services: Executes Zerologon and PetitPotam attacks to target known vulnerabilities.
* Execution Summary and Actionable Guidance: Completes with a success message and provides insights for further actions, such as hash cracking.


# AutoMapExec.sh
Provides in-depth security assessment and penetration testing, requiring domain, Domain Controller IP, and user credentials for a more thorough analysis.

<img src="https://github.com/emrekybs/AutoMapExec/blob/main/2.png">

### Key Features:
* Credential-Based Targeting: Uses user-provided credentials for a more thorough analysis.
* Kerberos Auditing and Extensive SMB Enumeration: Combines SilentHound and multiple NetExec commands for a deeper level of SMB and security analysis.
* Network and AD Comprehensive Scanning: Utilizes CrackMapExec for an extensive view of the network, including computer listings, local groups, and NTDS extraction.Testing Against Major Vulnerabilities: Incorporates exploitation of significant 
* Testing Against Major Vulnerabilities: Incorporates exploitation of significant vulnerabilities like Zerologon, PetitPotam, and NoPAC.
* BloodHound Integration and RDP Enablement: Facilitates AD data collection for BloodHound analysis and enables Remote Desktop Protocol.
* Diverse Command Execution and Data Retrieval: Performs a range of system commands and retrieves the SAM database for in-depth credential analysis.
* Detailed Execution Overview: Concludes with a summary of successful execution, signifying the completion of a comprehensive scanning and enumeration process.

# 𝗜𝗡𝗦𝗧𝗔𝗟𝗟𝗔𝗧𝗜𝗢𝗡 
       git clone https://github.com/bloodbane0/AD-AssessmentKit.git && cd AD-AssessmentKit && chmod +x * && ./install.sh
