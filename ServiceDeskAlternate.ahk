;<title>Frontier IT Service Desk Template Script</title>
;<pre>Frontier IT Service Desk AHK Template Script v0.0.0.5d Tested on Version AutoHotkey 1.1.33.10. Use CTRL+SHIFT+? for help.</pre>


crlf = "`n"
mim_ticket := "1116222"
f9TemplatesPath := "%A_ScriptDir%\F9AHK\F9Templates.ahk"
f9MajorPath := "%A_ScriptDir%\F9AHK\F9Major.ahk"
updateUrl := "https://overload.media:8888/mi/F9Major.ahk"

;;;;;;;;;;;;;
;; UPDATER ;;
;;;;;;;;;;;;;

checkFile(){
	ifNotExist, %f9MajorPath%
	{
		miText =
		(
		;;MAJOR INCIDENT TEMPLATE

		miCheck(){
			Return
		}
		;;;;;;;;;;;;;;;;;;;;
		;;This template will be used to create
		;;uniform tickets for Major Incidents and
		;;there resolutions.
		;;;;;;;;;;;;;;;;;;;;
		)
		FileAppend, %miText%, %f9MajorPath%
	}

	Return
}


checkFile()
#include %A_ScriptDir%\F9AHK\
#include %A_ScriptDir%\F9AHK\F9Major.ahk
#include %A_ScriptDir%\F9AHK\F9Templates.ahk
#include %A_ScriptDir%\F9AHK\F9Functions.ahk


;;;;;;;;;;;;;;;;
;<summary>Default Customer Entry</summary>
;<remarks>todo</remarks>
^+1::
defaultCustomer()
return


;;Issue Has Been Resolved.
^+2::
issueResolved()
Return


;<summary>Stations Ticket</summary>
;<remarks>This Data Collection template contains all of the required information that the stations team requires for a ticket to be submitted to them.</remarks>
^+3::
stationsRequest()
return


;;;;;;;;;;;;;;;;
;<summary>Outage Report</summary>
;<remarks>This data collection template must be filled out when a user reports an IT Outage.</remarks>
^+5::
outageReport()
return

;;;;;;;;;;;;;;;;
;<summary>Default Customer Entry</summary>
;<remarks>todo</remarks>
^NumpadDot::
	defaultCustomer()
return

;;Issue Has Been Resolved.
^Numpad3::
	issueResolved()
Return

;Major Incidents
::!mim::
	insertMIM()
Return

::#mim::
	insertMITicket()
Return



;;;;;;;;;;;;;;;;
;<summary>Outage Report</summary>
;<remarks>This data collection template must be filled out when a user reports an IT Outage.</remarks>
^Numpad5::
	outageReport()
return

;<summary>Stations Ticket</summary>
;<remarks>This Data Collection template contains all of the required information that the stations team requires for a ticket to be submitted to them.</remarks>
^Numpad1::
	stationsRequest()
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
	schooxReset()
return


;<summary>Password Reset Request Vistair</summary>
;<remarks>Password reset request for Vistair/Docunet (often SSO).</remarks>
::!vistair::
	vistairReset()
return

;<summary>Password Reset Request Active Directory</summary>
;<remarks>Reset passwrod reset for Windows, SSO, Active Directory, MSOffice, Myfrontier.org ect...</remarks>
::!ad::
	adReset()
return

;<summary>Password Reset Request New Skies apps</summary>
;<remarks>Reset password for Navitaire, GoNow, SkySpeed, Levarti Max OPS - any of the New Skies apps.</remarks>
::!ns::
  navitaireReset()
return

;<summary>Password Reset Request Active Ultipro</summary>
;<remarks>Request a default password for Ultipro.</remarks>
::!ultipro::
	ultiproReset()
return


;<summary>Password Reset Request NetTracer</summary>
;<remarks>NetTracer password reset request.</remarks>
::!nettracer::
	nettracerReset()
return

;<summary>Directed to FLICA support.</summary>
;<remarks>todo</remarks>
::.flica::
	flicaReset()
return

;<summary>CrewTrac Support</summary>
;<remarks>todo</remarks>
::.crewtrac::
	crewtracReset()
return

;<summary>AvioBook/EFB Install</summary>
;<remarks>For assistance reinstalling Aviobook, passwords are set in Active Directory.</remarks>
::.efbins::
	efbInstall()
return

;<summary>AvioBook/EFB Install</summary>
;<remarks>For assistance reinstalling Aviobook, passwords are set in Active Directory.</remarks>
::.efbre::
	efbReinstall()
return


;<summary>AvioBook/EFB Install</summary>
;<remarks>For assistance reinstalling Aviobook, passwords are set in Active Directory.</remarks>
::.efbpw::
	efbPasswordReset()
return

;<summary>flytab support</summary>
;<remarks>todo</remarks>
::.flytab::
	flytabConfig()
return

;<summary>trax support</summary>
;<remarks>todo</remarks>
::!trax::
traxReset()
return


;<summary>Expired Account</summary>
;<remarks>todo</remarks>
::.expired::
	expiredAccount()
return


;<summary>.id90</summary>
;<remarks>todo</remarks>
::.id90::
	id90Reset()
return


;<summary>Password Reset Request myidtravel</summary>
;<remarks>todo</remarks>
::.idtravel::
	idTravelReset()
return

;<summary>MS Authenticator assistance</summary>
;<remarks>todo</remarks>
::.msauth::
	mfaSetup()
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
	vpnConnect()
return

;<summary>VPN Assistance</summary>
;<remarks>todo</remarks>
::.vpnissue::
	vpnIssue()
return



;<summary>Network Share Access Request</summary>
;<remarks>todo</remarks>
::!netshare::
netShare()
return


;<summary>Network Share Access Request</summary>
;<remarks>todo</remarks>
::!citrixapp::
	citrixAppRequest()
return

;<summary>Network Share Access Reques</summary>
;<remarks>todo</remarks>
::.install::
	softwareInstall()
return

;<summary>Todo</summary>
;<remarks>todo</remarks>
::.prosafe::
prosafe()
return

;<summary>Single Sign On Assistance.</summary>
;<remarks>todo</remarks>
::.sso::
ssoAssist()
return

;<summary>Navitaire Reactivation</summary>
;<remarks>todo</remarks>
::.react::
reactivated()
return


;<summary>Adobe Acrobat Update</summary>
;<remarks>todo</remarks>
::.adobeup::
adobeUpdate()
return


;<summary>Adobe Creative Cloud installation</summary>
;<remarks>todo</remarks>
::.adobein::
adobeInstall()
return


;<summary>Adobe Update Software bypass</summary>
;<remarks>todo</remarks>
::.adobeerr::	
	adobeError()
return



;<summary>AD Account Inactive</summary>
;<remarks>todo</remarks>
::.inact::
	userInactive()
return
