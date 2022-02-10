;<title>Frontier IT Service Desk Template Script</title>
;<pre>Frontier IT Service Desk AHK Template Script v0.0.0.5d Tested on Version AutoHotkey 1.1.33.10. Use CTRL+SHIFT+? for help.</pre>


;TODO: Refactor hotstrings into includeable files for easy mantainance.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; *** INIT AND UPDATE *** ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
initFileName := "F9AHK.ini"
initFilePath = %A_ScriptDir%\%initFileName%
initFile := FileOpen(initFilePath, "rw")
initData := initFile.Read()
initFile.Close()

;;OI

f9OngoingPath := "%A_ScriptDir%\F9AHK\F9Ongoing.ahk"
ifNotExist, %f9OngoingPath%
{
	FormatTime, runDtTime, YYYYMMDDHH24MISS
	OutputDebug, "Ongoing not found."
	OutputDebug, %f9OngoingPath%
	ongoingText =
	(
	;;ONGOING INCIDENT TEMPLATE


	;;;;;;;;;;;;;;;;;;;;
	;;This template will be used to create
	;;uniform tickets for ongoing issues that
	;;are expected to be resolved.
	;;;;;;;;;;;;;;;;;;;;
	)

	FileAppend, %ongoingText%, %f9OngoingPath%
;	IniWrite, %runDtTime%, %initData%, "Ongoing", "OG-Update"
}

;;;MI


f9MajorPath := "%A_ScriptDir%\F9AHK\F9Major.ahk"
ifNotExist, %f9MajorPath%
{
	FormatTime, runDtTime, YYYYMMDDHH24MISS
	OutputDebug, "Major not found."
	OutputDebug, %f9MajorPath%
	miText =
	(
	;;MAJOR INCIDENT TEMPLATE

	;;;;;;;;;;;;;;;;;;;;
	;;This template will be used to create
	;;uniform tickets for Major Incidents and
	;;there resolutions.
	;;;;;;;;;;;;;;;;;;;;
	)

	FileAppend, %miText%, %f9MajorPath%
;	IniWrite, %runDtTime%, %initData%, "Major", "MI-Update"

}

IfExist, %initFilePath%
{
	FileDelete, %initFilePath%
}
;initFile = FileOpen(initFilePath, "rw")
;initFile.Write(initData)
;initFile.Close()
;FileAppend, %initData%, %initFilePath%

#include %A_ScriptDir%\F9AHK\
#include F9Ongoing.ahk
#include mi_templates.ahk

;;;;;;;;;;;;;
;; UPDATER ;;
;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;
;<summary>Default Customer Entry</summary>
;<remarks>todo</remarks>
^NumpadDot::
	BlockInput, On
	Sleep, 250
	Send, Default Customer{Tab}
	Sleep, 1000
	Send, {Enter}
	Sleep, 1000
	Send, {Enter}
	BlockInput, Off
return


;;;;;;;;;;;;;;;;
;<summary>Outage Report</summary>
;<remarks>This data collection template must be filled out when a user reports an IT Outage.</remarks>
^Numpad5::
mOutage=
(
User called in to report an outage.

Reporting Location: [Call Center / Department]
By: [FirstNameLastName] - [EmployeeID]
Contact: [Phone and/or Email]

1. What is down? [System Name]
2. What are users unable to do? [eg: Refunds, Book Flights]
3. What location(s) are impacted? [Physical Location]
4. Does this cause any impact to any flights and what flights are impacted? [Estimated Imaact / Delays]
5. If there are no flights impacted; does this issue have any financial impact? [Estimated Financial Impact]
6. What is the public IP address of the agents seeing the issue? [PublicIP via https://www.whatismyip.com/]
7. Please send screenshots of any error messages that you are receiving. [see attached]

Sent Copy of Report to [Incident Mgr]
)
SendInput, %mOutage%
return

;<summary>Stations Ticket</summary>
;<remarks>This Data Collection template contains all of the required information that the stations team requires for a ticket to be submitted to them.</remarks>
^Numpad1::
mStations=
(
User called in to request Stations Support
Issue Summary:

User ID:
User Name: 
Contact Phone:
Airport:
Station ID:
IP / Network Drop:
Problem Details:
)
SendInput, %mStations%
return

;<summary>Basic Ticket Template</summary>
;<remarks>todo</remarks>
^Numpad0::
mNameId=
(
[EmployeeID]
[FirstNameLastName]
)
SendInput, %mNameId%
return


;<summary>Password Reset (Generric)</summary>
;<remarks>Generric Password Reset Template</remarks>
::.pass::
pass=
(
User requests password reset for [System].
Unlocked Account / Reset Password
Verified Access.
)
SendInput, %pass%
return



;<summary>Password Reset Request Navitaire</summary>
;<remarks>Password reset for the Navitaire System Apps</remarks>
::.navitaire::
pass=
(
Password Reset: Navitaire.
User requests password reset for Navitaire. Unlocked Account / Reset Password.
)
Sleep, 250
BlockInput, on
SendInput, %pass%
BlockInput, off
return


;<summary>Password Reset Request GoNow</summary>
;<remarks>Same as above.</remarks>
;<seealso>Navitaire</seealso>
::.gonow::
pass=
(
Password Reset:GoNow.
User requests password reset for Navitaire GoNow. Unlocked Account / Reset Password.
)
SendInput, %pass%
return

;<summary>Password Reset Request GoNow (aditional)</summary>
;<remarks>Same as above.</remarks>
;<seealso>Navitaire</seealso>
::!gonow::
pass=
(
Password Reset:GoNow.
User requests password reset for Navitaire GoNow. Unlocked Account / Reset Password.
)
Sleep, 250
BlockInput, on
SendInput, %pass%
Sleep, 500
Send, {Tab}{Tab}Navitaire
Sleep, 250
Send, {Tab}{Enter}
BlockInput, off
return


;<summary>Password Reset Reuest Skyspeed</summary>
;<remarks>Same as above.</remarks>
;<seealso>Navitaire</seealso>
::.skyspeed::
pass=
(
Password Reset: SkySpeed.
User requests password reset for Navitaire Skyspeed. Unlocked Account / Reset Password.
)
SendInput, %pass%
return


;<summary>Password Reset Reuest Skyspeed (aditional)</summary>
;<remarks>Same as above.</remarks>
;<seealso>Navitaire</seealso>
::!skyspeed::
pass=
(
Password Reset: SkySpeed.
User requests password reset for Navitaire Skyspeed. Unlocked Account / Reset Password.
)
Sleep, 250
BlockInput, On
SendInput, %pass%
Sleep, 500
Send, {Tab}{Tab}Navitaire
Sleep, 250
Send, {Tab}{Enter}
BlockInput, off
return


;<summary>Password Reset Reuest LMC</summary>
;<remarks>Password Reset for the Loyalty Management Console. Seperate Navitaire From Gonow and Skyspeed.</remarks>
::.lmc::
pass=
(
Password Reset: Loyalty Management Console.
User requests password reset for Loyalty Management Console. Unlocked Account / Reset Password.
)
SendInput, %pass%
return


;<summary>Password Reset Request Schoox</summary>
;<remarks>Password reset request for the Schoox Training System (often SSO).</remarks>
::.schoox::
pass=
(
Password Reset: Schoox.
User requests password reset for SchooX. Unlocked Account / Reset Password.
)
Sleep, 250
BlockInput, On
SendInput, %pass%
Sleep, 500
Send, {Tab}{Tab}Schoox
Sleep, 250
Send, {Tab}{Enter}
BlockInput, Off
return


;<summary>Password Reset Request Vistair</summary>
;<remarks>Password reset request for Vistair/Docunet (often SSO).</remarks>
::.vistair::
pass=
(
Password Reset: Vistair.
User requests password reset for Vistair. Unlocked Account / Reset Password.
)
SendInput, %pass%
return


;<summary>Password Reset Request Vistair</summary>
;<remarks>Password reset request for Vistair/Docunet (often SSO).</remarks>
::!vistair::
pass=
(
Password Reset: Vistair.
User requests password reset for Vistair. Unlocked Account / Reset Password.
)
Sleep, 250
BlockInput, On
SendInput, %pass%
Sleep, 500
Send, {Tab}{Tab}Vistair
Sleep, 250
Send, {Tab}{Enter}
BlockInput, Off
return

;<summary>Password Reset Request Active Directory</summary>
;<remarks>Reset passwrod reset for Windows, SSO, Active Directory, MSOffice, Myfrontier.org ect...</remarks>
::.ad::
pass=
(
Password Reset: Active Directory, [Specific System].
User requests password reset for ActiveDirectory. Unlocked Account / Reset Password.
)
SendInput, %pass%
return

;<summary>Password Reset Request Active Directory</summary>
;<remarks>Reset passwrod reset for Windows, SSO, Active Directory, MSOffice, Myfrontier.org ect...</remarks>
::!ad::
InputBox, specSys, AD Input, Which System is the user attempting to access?
Sleep, 250
BlockInput, On
SendInput, Password Reset: Active Directory %specSys%.{Enter}User requests password reset for ActiveDirectory. Unlocked Account / Reset Password.
Sleep, 500
Send, {Tab}{Tab}ad
Sleep, 250
Send, {Tab}{Enter}
BlockInput, Off
return

;<summary>Password Reset Request Active Ultipro</summary>
;<remarks>Request a default password for Ultipro.</remarks>
::.ultipro::
pass=
(
Password Reset: Ultipro.
User requests password reset for Ultipro. Unlocked Account / Reset Password.
)
SendInput, %pass%
return


;<summary>Password Reset Request NetTracer</summary>
;<remarks>NetTracer password reset request.</remarks>
::.nettracer::
pass=
(
Password Reset: NetTracer.
User requests password reset for NetTracer. Unlocked Account / Reset Password
)
SendInput, %pass%
return

;<summary>Directed to FLICA support.</summary>
;<remarks>todo</remarks>
::.flica::
flica=
(
User attempting to access FLICA.
User requests assistance accessing Flica. Informed user to contact Flica support at 1-800-659-9859.
)
SendInput, %flica%
return

;<summary>CrewTrac Support</summary>
;<remarks>todo</remarks>
::.crewtrac::
crewtrac=
(
User requests assistance with CrewTrac Username and Password.
Informed user to contact CrewTrac support at crewschedulingsupervisors@flyfrontier.com or 720-374-4540.
)
SendInput, %crewtrac%
return

;<summary>AvioBook/EFB Install</summary>
;<remarks>For assistance reinstalling Aviobook, passwords are set in Active Directory.</remarks>
::.efbins::
efb=
(
User requests assistance with AvioBook/EFB.
Informed user to contact EFB at 720-295-7478.
)
SendInput, %efb%
return

;<summary>AvioBook/EFB Install</summary>
;<remarks>For assistance reinstalling Aviobook, passwords are set in Active Directory.</remarks>
::.efbre::
efb=
(
User requests assistance with AvioBook/EFB reinstall.
Informed user to contact EFB at 720-295-7478.
)
SendInput, %efb%
return


;<summary>AvioBook/EFB Install</summary>
;<remarks>For assistance reinstalling Aviobook, passwords are set in Active Directory.</remarks>
::.efbpw::
efb=
(
User requests assistance with AvioBook/EFB Password.
Reset user's password in Active Directory, advised user that all AD passwords will be reset aswell.
)
SendInput, %efb%
return

;<summary>flytab support</summary>
;<remarks>todo</remarks>
::.flytab::
flytab=
(
User requests assistance with their FlyTab, [SpecificIssue].
Directed user to contact Reatail In Motion support at 888-270-1510.
)
SendInput, %flytab%
return

;<summary>trax support</summary>
;<remarks>todo</remarks>
::.trax::
trax=
(
User requests password reset for Trax.
Informed user to contact Trax support at TraxBusAdmin@flyfrontier.com.
)
SendInput, %trax%
return


;<summary>Expired Account</summary>
;<remarks>todo</remarks>
::.expired::
expired=
(
Contractor AD account expired. Directed user to contact their frontier manager for reactivation in Contractor Portal.
)
SendInput, %expired%
return


;<summary>.id90</summary>
;<remarks>todo</remarks>
::.id90::
id90=
(
User requests assistance accessing ID90, [SpecificIssue].
Assisted user in recovering password via ID90Travel.com login page.
)
SendInput, %id90%
return


;<summary>Password Reset Request myidtravel</summary>
;<remarks>todo</remarks>
::.idtravel::
idtravel=
(
User requests assistance with MyIDTravel Login.
Verified user is using 6 digit employee id. Assisted user in recovering password via myidtravel.com login page. Walked user through setting up new password.
)
SendInput, %idtravel%
return

;<summary>MS Authenticator assistance</summary>
;<remarks>todo</remarks>
::.msauth::
msAuthen=
(
User requesting assistance with MS Authenticator Setup
Walked user through process of setting up MS Authenticator account. Advised user that they must have there Authentication Device with them when logging into a Frontier system incase authentication is required.
)
SendInput,%msAuthen%
return


;<summary>VPN Assistance</summary>
;<remarks>todo</remarks>
::.vpnconnect::
vpn=
(
User requests assistance connecting to VPN.
Assisted user in connecting secureid.myfrontier.org.
)
SendInput, %vpn%
return

;<summary>VPN Assistance</summary>
;<remarks>todo</remarks>
::.vpnissue::
vpn=
(
User is calling to report a VPN issue.
Specific Issue:
Troubleshooting:
Resolution: [Resolved / Escalated to]
)
SendInput, %vpn%
return


;<summary>Network Share Access Reques</summary>
;<remarks>todo</remarks>
::.netshare::
share=
(
User is calling to report that they can not access a required network file share.
User requests [Read/Read Write] Access to the following Network Share
[\\Network-Share\Acccess]
Approved by [Leadership]
)
SendInput, %share%
return

;<summary>Network Share Access Reques</summary>
;<remarks>todo</remarks>
::.install::
share=
(
User is calling to request installation of software [AppNameHere].
Is a licence required: [Yes/No]
Approved by [Leadership]
Request sent to [Agent] in [Department] for deployment.
)
SendInput, %share%
return

;<summary>Bse Email Template</summary>
;<remarks>todo</remarks>
;::.eml::
;eml=
;(
;Hello [...]
; Thanks for contacting the IT helpdesk. I will happy to assist you with your [issue] today.
; [body]
; Please let me know if you have any other questions.
;)
;SendInput, %eml%
;return


;<summary>Email Password Reset Request</summary>
;<remarks>todo</remarks>
;::.epass::
;epass= 
;(
;Hello [...]
; Thanks for contacting the IT helpdesk. I will happy to assist you with your Password Reset today.
; I've unlocked the account and reset the password. Your user name and temporary password for [system] will be:
;	[username]
;	[password]
; Please let me know if you have any other questions.
;)
;SendInput, %epass%
;
;return

;<summary>Todo</summary>
;<remarks>todo</remarks>
;::.eauthen::
;eauthen=
;(
;Hello [...]
;- Thanks for contacting the IT helpdesk. I will happy to assist you with your MS Authenticator today. First we need to be sure that your entering the correct information into the correct screen.
;- The Microsoft Authenticator Sign in page is branded for Frontier Airlines and can be identified by a photo of a Jet Engine in the background. For this system you user name will be your FlyFrontier.com Email address or your Windows Sign-in name with @flyfrontier.com attached to the end.
;- The password will be the same password that you use to log on to Windows on the Frontier Airlines Network and the same password you use to log onto MyFrontier.org. All of these passwords are synchronized so if you change one, all of the others change as well.
;- Once signed in, you may be presented with prompts for "More information required". If you do, please follow the onscreen instructions to complete the Authenticator setup. You will need to have a mobile phone that authenticator can send messages to, or  that you have installed the Authenticator Mobile App to.
;Please let me know if you have any other questions.
;)
;SendInput, %eauthen%
;return


;<summary>Todo</summary>
;<remarks>todo</remarks>
;::.einfo::
;einfo=
;(
;Hello [...],
;Thanks for contacting the IT Support Help Desk, I’m happy to assist you with this issue. In order to do so I’m going to need to collect some more information. 
;-- Your Employee ID Number / Sign in name
;-- What is the name of the system that you are trying to access?
;-- Where are you physically located?
;-- Are you using a Frontier Airlines Laptop or Workstation, or are you using personal equipment?
;---- If on Frontier equipment – What is the Computer Name (located on a label near the lower right hand corner of the monitor) or IP Address (located on the desktop background)?
;-- Are you Connected to a Frontier Airlines Network or is it a personal ISP?
;-- Are other employees effected?
;-- The Employee ID Number / Sign in name and the First and Last Names of any of the other effected employees.
;)
;
;SendInput, %einfo%
;return

;<summary>Todo</summary>
;<remarks>todo</remarks>
::.prosafet::
code=
(
User is requesting the activation code for ProSafeT. 
Provided activation code 4D25-BE28-93CA-8088.
Verified activation.
)
SendInput, %code%
return

;<summary>Single Sign On Assistance.</summary>
;<remarks>todo</remarks>
::.sso::
sso=
(
 User's account in this service is Single Sign On. Advised user how Single Sign on works and how to use it in this app.
)
SendInput, %sso%
return

;<summary>Navitaire Reactivation</summary>
;<remarks>todo</remarks>
::.react::
react=
(
Navitaire Account Disabled... Authorization for reactivation provided by [SupervisorName] - [SupervisorID].
)
SendInput, %react%
return


;<summary>Adobe Acrobat Update</summary>
;<remarks>todo</remarks>
::.adobeup::
update=
(
User reports that their Adobe [SOFTWARE NAME] is nonfunctional, and requires a software update.

Assisted user in updating the aforementioned software via Adobe Creative Cloud, the Adobe software hub.
)
SendInput, %update%
return


;<summary>Adobe Creative Cloud installation</summary>
;<remarks>todo</remarks>
::.adobein::
install=
(
User states that they cannot locate Adobe Creative Cloud - the application needs to be installed.

Remoted into the user's device via [Dameware/Teams]. Navigated to https://helpx.adobe.com/download-install/kb/creative-cloud-desktop-app-download.html to initate the Creative Cloud installation.

Opened Registry Editor on the device, navigated to HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\CurrentVersion\InternetSettings, and Security_HKLM_Only key to 0 from 1.
)
SendInput, %install%
return


;<summary>Adobe Update Software bypass</summary>
;<remarks>todo</remarks>
::.adobeerr::
error=
(
User reports that they are still receiving the Update message when they use their Adobe software, even after the update via Creative Cloud.

Downloaded Zones.reg onto the agent's computer. Merged the .reg file via Registry Editor.
)
SendInput, %error%
return

;<summary>Password Complexity Requirements</summary>
;<remarks>todo</remarks>
::.passreq::
(
Advised agent that new password required to be at-least 8 characters long, it must include at-least one capitol letter, one lowercase letter, one number and one special character. It must not contain the user's name or a password that has been used before.
)
return

;<summary>AD Account Inactive</summary>
;<remarks>todo</remarks>
::.inact::
pass=
(
inactivity script had run on user's AD Account - reactivated, advised wait 30 min to login.
)
SendInput, %pass%
return
