;<title>Frontier IT Service Desk Template Script</title>
;<pre>Frontier IT Service Desk AHK Template Script v0.0.0.5d Tested on Version AutoHotkey 1.1.33.10. Use CTRL+SHIFT+? for help.</pre>


crlf = "`n"
mim_ticket := "1116222"
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
#include %A_ScriptDir%\F9AHK\F9Major.ahk

;;;;;;;;;;;;;
;; UPDATER ;;
;;;;;;;;;;;;;


;<summary>Basic Ticket Template</summary>
;<remarks>todo</remarks>
^+0::
mNameId=
(
[EmployeeID]
[FirstNameLastName]
)
Send, %mNameId%
return


;;;;;;;;;;;;;;;;
;<summary>Default Customer Entry</summary>
;<remarks>todo</remarks>
^+1::
	BlockInput, On
	Sleep, 250
	Send, Default Customer{Tab}
	Sleep, 1000
	Send, {Enter}
	Sleep, 1000
	Send, {Enter}
	BlockInput, Off
return


;;Issue Has Been Resolved.
^+2::
Sleep, 250
Send, Issue Has Been Resolved.
Return


;<summary>Stations Ticket</summary>
;<remarks>This Data Collection template contains all of the required information that the stations team requires for a ticket to be submitted to them.</remarks>
^+3::
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
Send, %mStations%
return


;;;;;;;;;;;;;;;;
;<summary>Outage Report</summary>
;<remarks>This data collection template must be filled out when a user reports an IT Outage.</remarks>
^+5::
mOutage=
(
User is calling to report [Outage/Delay] at [Station].
Caller Name:
Caller Contact:
Caller Station:

What application or system is down?

Does this affect one user or multiple users?

What are users unable to do?

Is one station impacted or is multiple station impacted?

Does this cause any impact to any flights?

What flight(s) impacted? 
(If there is a flight in a couple of days then this does not meet the requirement)

If there are no flights impacted; does this issue have any financial impact?

If there are no flights impacted and no financial impact, then this is not a major incident!!!!

Sent Copy of Report to [Incident Management Cueue]
)
Send, %mOutage%
return

;^+9::
;ReportPath = "C:\tmp\report.txt"
;promptSystem = "What application or system is down?"
;promptUsers = "Does this affect one user or multiple users?"
;promptActivity = "What are users unable to do?"
;promptImpactStns = "Is one station impacted or is multiple station impacted?"
;promptImpactFlights = "Does this cause any impact to any flights?"
;promptFlightNumbers = "What flight(s) impacted?"
;promptImpactFinance = "If there are no flights impacted; does this issue have any financial impact?"

;InputBox, rptSystem, AD Input, %promptSystem%
;InputBox, rptAffectedUsers, AD Input, %promptUsers%
;InputBox, rptActivityStoped, AD Input, %promptActivity%
;InputBox, rptImpactStns, AD Input, %promptImpactStns%
;InputBox, rptImpactFlights, AD Input, %promptImpactFlights%
;InputBox, rptFlightNumbers, AD Input, %promptFlightNumbers%
;InputBox, rptImpactFinance, AD Input, %promptImpactFinance%
;if FileExist(%ReportPath%){
;	FileDelete, %ReportPath%
;}
;FileAppend, promptSystem . "	" . rptSystem . crlf , ReportPath
;FileAppend, promptUsers . "	" . rptAffectedUsers . crlf , ReportPath
;FileAppend, promptActivity . "	" . rptActivityStoped . crlf , ReportPath
;FileAppend, promptImpactStns . "	" . rptImpactStns . crlf , ReportPath
;FileAppend, promptImpactFlights . "	" . rptImpactFlight . crlf , ReportPath
;FileAppend, promptFlightNumbers . "	" . rptFlightNumbers. crlf , ReportPath
;FileAppend, promptImpactFinance . "	" . rptImpactFinance. crlf , ReportPath
;Sleep, 250
;Run, "notepad.exe " . ReportPath
;return



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

;;Issue Has Been Resolved.
^Numpad3::
Sleep, 250
Send, Issue Has Been Resolved.
Return

;^Numpad9::
;ReportPath = "C:\tmp\report.txt"
;promptSystem = "What application or system is down?"
;promptUsers = "Does this affect one user or multiple users?"
;promptActivity = "What are users unable to do?"
;promptImpactStns = "Is one station impacted or is multiple station impacted?"
;promptImpactFlights = "Does this cause any impact to any flights?"
;promptFlightNumbers = "What flight(s) impacted?"
;promptImpactFinance = "If there are no flights impacted; does this issue have any financial impact?"

;InputBox, rptSystem, AD Input, %promptSystem%
;InputBox, rptAffectedUsers, AD Input, %promptUsers%
;InputBox, rptActivityStoped, AD Input, %promptActivity%
;InputBox, rptImpactStns, AD Input, %promptImpactStns%
;InputBox, rptImpactFlights, AD Input, %promptImpactFlights%
;InputBox, rptFlightNumbers, AD Input, %promptFlightNumbers%
;InputBox, rptImpactFinance, AD Input, %promptImpactFinance%
;if FileExist(%ReportPath%){
;	FileDelete, %ReportPath%
;}
;FileAppend, promptSystem . "	" . rptSystem . crlf , ReportPath
;FileAppend, promptUsers . "	" . rptAffectedUsers . crlf , ReportPath
;FileAppend, promptActivity . "	" . rptActivityStoped . crlf , ReportPath
;FileAppend, promptImpactStns . "	" . rptImpactStns . crlf , ReportPath
;FileAppend, promptImpactFlights . "	" . rptImpactFlight . crlf , ReportPath
;FileAppend, promptFlightNumbers . "	" . rptFlightNumbers. crlf , ReportPath
;FileAppend, promptImpactFinance . "	" . rptImpactFinance. crlf , ReportPath
;Sleep, 250
;Run, "notepad.exe " . ReportPath
;return



;;;;;;;;;;;;;;;;
;<summary>Outage Report</summary>
;<remarks>This data collection template must be filled out when a user reports an IT Outage.</remarks>
^Numpad5::
mOutage=
(
User is calling to report [Outage/Delay] at [Station].
Caller Name:
Caller Contact:
Caller Station:

What application or system is down?

Does this affect one user or multiple users?

What are users unable to do?

Is one station impacted or is multiple station impacted?

Does this cause any impact to any flights?

What flight(s) impacted? 
(If there is a flight in a couple of days then this does not meet the requirement)

If there are no flights impacted; does this issue have any financial impact?

If there are no flights impacted and no financial impact, then this is not a major incident!!!!

Sent Copy of Report to [Incident Management Cueue]
)
Send, %mOutage%
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
Send, %mStations%
return

;<summary>Basic Ticket Template</summary>
;<remarks>todo</remarks>
^Numpad0::
mNameId=
(
[EmployeeID]
[FirstNameLastName]
)
Send, %mNameId%
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
Send, %pass%
return

;<summary>Password Reset Request Schoox</summary>
;<remarks>Password reset request for the Schoox Training System (often SSO).</remarks>
::!schoox::
pass=
(
Password Reset: Schoox.
User requests password reset for SchooX. Unlocked Account / Reset Password.
)
Sleep, 250
BlockInput, On
Send, %pass%
Sleep, 500
Send, {Tab}{Tab}Schoox
Sleep, 250
Send, {Tab}{Enter}
BlockInput, Off
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
Send, %pass%
Sleep, 500
Send, {Tab}{Tab}Vistair
Sleep, 250
Send, {Tab}{Enter}
BlockInput, Off
return

;<summary>Password Reset Request Active Directory</summary>
;<remarks>Reset passwrod reset for Windows, SSO, Active Directory, MSOffice, Myfrontier.org ect...</remarks>
::!ad::
InputBox, specSys, AD Input, Which System is the user attempting to access?
Sleep, 250
BlockInput, On
Send, Password Reset: Active Directory %specSys%.{Enter}User requests password reset for ActiveDirectory. Unlocked Account / Reset Password.
Sleep, 500
Send, {Tab}{Tab}ad
Sleep, 250
Send, {Tab}{Enter}
BlockInput, Off
return

;<summary>Password Reset Request New Skies apps</summary>
;<remarks>Reset password for Navitaire, GoNow, SkySpeed, Levarti Max OPS - any of the New Skies apps.</remarks>
::!ns::
InputBox, specSys, New Skies Input, Which New Skies System is the user attempting to access?
InputBox, specEnv, Environment Input, Which New Skies Environment is this system for?, , , , , , , , Production
Sleep, 250
BlockInput, On
Send, Password Reset: %specSys% %specEnv%.{Enter}User requests password reset for %specSys% %specEnv%. Unlocked Account / Reset Password.
Sleep, 500
Send, {Tab}{Tab}%specSys%
Sleep, 250
Send, {Tab}{Enter}
BlockInput, Off
return

;<summary>Password Reset Request Active Ultipro</summary>
;<remarks>Request a default password for Ultipro.</remarks>
::!ultipro::
pass=
(
Password Reset: Ultipro.
User requests password reset for Ultipro. Unlocked Account / Reset Password.
)
Sleep, 250
BlockInput, On
Send, %pass%
Sleep, 500
Send, {Tab}{Tab}Ultipro
Sleep, 250
Send, {Tab}{Enter}
BlockInput, off
return


;<summary>Password Reset Request NetTracer</summary>
;<remarks>NetTracer password reset request.</remarks>
::!nettracer::
pass=
(
Password Reset: NetTracer.
User requests password reset for NetTracer. Unlocked Account / Reset Password
)
Sleep, 250
BlockInput, On
Send, %pass%
Sleep, 500
Send, {Tab}{Tab}NetTracer
Sleep, 250
Send, {Tab}{Enter}
BlockInput, off
return

;<summary>Directed to FLICA support.</summary>
;<remarks>todo</remarks>
::.flica::
flica=
(
User attempting to access FLICA.
User requests assistance accessing Flica. Informed user to contact Flica support at 1-800-659-9859.
)
Send, %flica%
return

;<summary>CrewTrac Support</summary>
;<remarks>todo</remarks>
::.crewtrac::
crewtrac=
(
User requests assistance with CrewTrac Username and Password.
Informed user to contact CrewTrac support at crewschedulingsupervisors@flyfrontier.com or 720-374-4540.
)
Send, %crewtrac%
return

;<summary>AvioBook/EFB Install</summary>
;<remarks>For assistance reinstalling Aviobook, passwords are set in Active Directory.</remarks>
::.efbins::
efb=
(
User requests assistance with AvioBook/EFB.
Informed user to contact EFB at 720-295-7478.
)
Send, %efb%
return

;<summary>AvioBook/EFB Install</summary>
;<remarks>For assistance reinstalling Aviobook, passwords are set in Active Directory.</remarks>
::.efbre::
efb=
(
User requests assistance with AvioBook/EFB reinstall.
Informed user to contact EFB at 720-295-7478.
)
Send, %efb%
return


;<summary>AvioBook/EFB Install</summary>
;<remarks>For assistance reinstalling Aviobook, passwords are set in Active Directory.</remarks>
::.efbpw::
efb=
(
User requests assistance with AvioBook/EFB Password.
Reset user's password in Active Directory, advised user that all AD passwords will be reset aswell.
)
Send, %efb%
return

;<summary>flytab support</summary>
;<remarks>todo</remarks>
::.flytab::
flytab=
(
User requests assistance with their FlyTab, [SpecificIssue].
Directed user to contact Reatail In Motion support at 888-270-1510.
)
Send, %flytab%
return

;<summary>trax support</summary>
;<remarks>todo</remarks>
::!trax::
trax=
(
User requests password reset for Trax.
Informed user to contact Trax support at TraxBusAdmin@flyfrontier.com.
)
Sleep, 250
BlockInput, On
Send, %trax%
Sleep, 500
Send, {Tab}{Tab}Trax
Sleep, 250
Send, {Tab}{Enter}
BlockInput, off
return


;<summary>Expired Account</summary>
;<remarks>todo</remarks>
::.expired::
expired=
(
Contractor AD account expired. Directed user to contact their frontier manager for reactivation in Contractor Portal.
)
Send, %expired%
return


;<summary>.id90</summary>
;<remarks>todo</remarks>
::.id90::
id90=
(
User requests assistance accessing ID90, [SpecificIssue].
Assisted user in recovering password via ID90Travel.com login page.
)
Send, %id90%
return


;<summary>Password Reset Request myidtravel</summary>
;<remarks>todo</remarks>
::.idtravel::
idtravel=
(
User requests assistance with MyIDTravel Login.
Verified user is using 6 digit employee id. Assisted user in recovering password via myidtravel.com login page. Walked user through setting up new password.
)
Send, %idtravel%
return

;<summary>MS Authenticator assistance</summary>
;<remarks>todo</remarks>
::.msauth::
msAuthen=
(
User requesting assistance with MS Authenticator Setup
Walked user through process of setting up MS Authenticator account. Advised user that they must have there Authentication Device with them when logging into a Frontier system incase authentication is required.
)
Send,%msAuthen%
return


;<summary>MS Authenticator reset</summary>
;<remarks>todo</remarks>
::!mfareset::
reset=
(
User requesting a complete MFA Reset.
As they are unable to sign in to aka.ms/mfasetup to update their information, this ticket has been escalated to Systems Engineering to process the reset
)
Sleep, 250
BlockInput, On
Send, %reset%
Sleep, 500
Send, {Tab}{Tab}Authenticator
Sleep, 250
Send, {Tab}{Enter}
BlockInput, off
return


;<summary>VPN Assistance</summary>
;<remarks>todo</remarks>
::.vpnconnect::
vpn=
(
User requests assistance connecting to VPN.
Assisted user in connecting secureid.myfrontier.org.
)
Send, %vpn%
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
Send, %vpn%
return



;<summary>Network Share Access Request</summary>
;<remarks>todo</remarks>
::!netshare::
share=
(
User is calling to report that they can not access a required network file share.
User requests [Read/Read Write] Access to the following Network Share
[\\Network-Share\Access]
)
Sleep, 250
BlockInput, On
Send, %share%
MsgBox, 4,, Has this been approved by the user's leadership? (press Yes or No)
IfMsgBox, Yes
	Send, {Enter}Approved by [Leadership]
Else
	Send, {Enter}Advised user contact their manager and submit a request.
Sleep, 500
Send, {Tab}{Tab}Shared Drive Access
Sleep, 250
Send, {Tab}{Enter}
BlockInput, off
return


;<summary>Network Share Access Request</summary>
;<remarks>todo</remarks>
::!citrixapp::
app=
(
User is calling to request access to a software within Citrix.
Software Name(s): [Software-Names]
AD Group Name(s): [Group-Names].
)
Sleep, 250
BlockInput, On
Send, %app%
MsgBox, 4,, Has this been approved by the user's leadership? (press Yes or No)
IfMsgBox, Yes
	Send, {Enter}Approved by [Leadership]
Else
	Send, {Enter}Advised user contact their manager and submit a request.
Sleep, 500
Send, {Tab}{Tab}Citrix Application Access
Sleep, 250
Send, {Tab}{Enter}
BlockInput, Off
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
Send, %share%
return

;<summary>Todo</summary>
;<remarks>todo</remarks>
::.prosafet::
code=
(
User is requesting the activation code for ProSafeT. 
Provided activation code 4D25-BE28-93CA-8088.
Verified activation.
)
Send, %code%
return

;<summary>Single Sign On Assistance.</summary>
;<remarks>todo</remarks>
::.sso::
sso=
(
 User's account in this service is Single Sign On. Advised user how Single Sign on works and how to use it in this app.
)
Send, %sso%
return

;<summary>Navitaire Reactivation</summary>
;<remarks>todo</remarks>
::.react::
react=
(
Navitaire Account Disabled... Authorization for reactivation provided by [SupervisorName] - [SupervisorID].
)
Send, %react%
return


;<summary>Adobe Acrobat Update</summary>
;<remarks>todo</remarks>
::.adobeup::
update=
(
User reports that their Adobe [SOFTWARE NAME] is nonfunctional, and requires a software update.

Assisted user in updating the aforementioned software via Adobe Creative Cloud, the Adobe software hub.
)
Send, %update%
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
Send, %install%
return


;<summary>Adobe Update Software bypass</summary>
;<remarks>todo</remarks>
::.adobeerr::
error=
(
User reports that they are still receiving the Update message when they use their Adobe software, even after the update via Creative Cloud.

Downloaded Zones.reg onto the agent's computer. Merged the .reg file via Registry Editor.
)
Send, %error%
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
Send, %pass%
return
