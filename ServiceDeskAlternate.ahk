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

;IfExist, %initFilePath%
;{
;	FileDelete, %initFilePath%
;}
;initFile = FileOpen(initFilePath, "rw")
;initFile.Write(initData)
;initFile.Close()
;FileAppend, %initData%, %initFilePath%

#include %A_ScriptDir%\F9AHK\
;#include %A_ScriptDir%\F9AHK\F9Major.ahk
#include %A_ScriptDir%\F9AHK\F9Templates.ahk
#include %A_ScriptDir%\F9AHK\F9Functions.ahk



;miCheck()
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
;::!mim::
;	insertMIM()
;Return

;::#mim::
;	insertMITicket()
;Return


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
