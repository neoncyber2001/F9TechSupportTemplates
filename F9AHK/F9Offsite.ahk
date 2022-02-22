;<summary> Offsite Active Directory Password Reset.</summary>
;<remarks> Active Directory Password Reset for agents who are not on the Frontier network attempting to sign in to a Frontier AD site, such as MyFrontier.org, Frontier VPN, or a Single Sign On software.</remarks>
::.offsite.ad::
pass=
(
Offsite Password Reset: Active Directory, [Specific System].
User requests password reset for Active Directory.
User is currently offsite - temporary passwords will be ineffective at this time, as there is an ongoing issue with Microsoft's internal and external Azure AD controllers that prevents new passwords being created offsite.
Unlocked Account / Reset Password with "User Must Change Password at Next Logon" unchecked.
Advised user to update their password when they sign on to Windows on the Frontier domain by pressing CTRL+ALT+DEL and selecting Change a Password from the System Interrupt menu.
)
SendInput, %pass%
return