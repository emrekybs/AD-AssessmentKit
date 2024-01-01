[![EmreKybs](https://img.shields.io/badge/MadeBy-EmreKybs-greem)
# ADassesmentKit
These scripts serve distinct purposes: AD-SecurityAudit.sh is suited for initial reconnaissance without user credentials,
while AutoMapExec.sh provides a more authenticated and thorough examination of network and AD security.

# AD-SecurityAudit.sh
The AD-SecurityAudit.sh script is specifically tailored for security audits of Active Directory (AD) environments. 
It focuses on assessing AD security without requiring user credentials, relying only on the domain name and Domain Controller IP address. 
This approach is particularly useful for initial reconnaissance and vulnerability identification in AD domains.

<img src="https://github.com/emrekybs/AutoMapExec/blob/main/1.png">

### Key Features:
* LDAP and Service Account Queries: Conducts LDAP searches targeting service accounts in the AD.
* Kerberos Ticket Analysis: Uses Impacket's tools for analyzing Kerberos ticket vulnerabilities and identifying accounts without pre-authentication
* Comprehensive Kerberos and SMB Enumeration: Employs SilentHound and Enum4linux-ng for Kerberos auditing and detailed SMB, user, and system information scanning.
* Enumeration Techniques: Implements RID brute-force and NetExec SMB enumeration for discovering user accounts, groups, and security policies.
* Exploitation of Windows Services: Executes Zerologon and PetitPotam attacks to target known vulnerabilities.
* Execution Summary and Actionable Guidance: Completes with a success message and provides insights for further actions, such as hash cracking.


# AutoMapExec.sh
AutoMapExec.sh is an automated script for network mapping and security scanning
that requires user credentials (username and password)along with the domain and Domain Controller IP address.
This requirement allows for more in-depth and authenticated analysis of network environments and AD structures, making it ideal for detailed security assessments and penetration testing.

<img src="https://github.com/emrekybs/AutoMapExec/blob/main/2.png">

### Key Features:
* Credential-Based Targeting: Uses user-provided credentials for a more thorough analysis.
* Kerberos Auditing and Extensive SMB Enumeration: Combines SilentHound and multiple NetExec commands for a deeper level of SMB and security analysis.
* Network and AD Comprehensive Scanning: Utilizes CrackMapExec for an extensive view of the network, including computer listings, local groups, and NTDS extraction.Testing Against Major Vulnerabilities: Incorporates exploitation of significant 
* Testing Against Major Vulnerabilities: Incorporates exploitation of significant vulnerabilities like Zerologon, PetitPotam, and NoPAC.
* BloodHound Integration and RDP Enablement: Facilitates AD data collection for BloodHound analysis and enables Remote Desktop Protocol.
* Diverse Command Execution and Data Retrieval: Performs a range of system commands and retrieves the SAM database for in-depth credential analysis.
* Detailed Execution Overview: Concludes with a summary of successful execution, signifying the completion of a comprehensive scanning and enumeration process.

# 𝗜𝗡𝗦𝗧𝗔𝗟𝗟𝗔𝗧𝗜𝗢𝗡 𝗜𝗡𝗦𝗧𝗥𝗨𝗖𝗧𝗜𝗢𝗡𝗦
      $ git clone https://github.com/emrekybs/AutoMapExec.git
      $ cd AutoMapExec
      $  chmod +x * && bash install.sh
