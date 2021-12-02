;<title>Frontier IT Service Desk Template Script</title>
;<pre>Frontier IT Service Desk AHK Template Script v0.0.0.5d Tested on Version AutoHotkey 1.1.33.10. Use CTRL+SHIFT+? for help.</pre>


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
;<remarks>todo</remarks>
^Numpad5::
mOutage=
(
Reporting Location: [Call Center / Department]
By: [FirstNameLastName] - [EmployeeID]
Contact: [Phone and/or Email]

1.What is down? [System Name]
2.What are users unable to do? [eg: Refunds, Book Flights]
3.What location(s) are impacted? [Physical Location]
4.Does this cause any impact to any flights and what flights are impacted? [Estimated Imaact / Delays]
5.If there are no flights impacted; does this issue have any financial impact? [Estimated Financial Impact]
6. What is the public IP address of the agents seeing the issue? [PublicIP via https://www.whatismyip.com/]
7. Please send screenshots of any error messages that you are receiving. [see attached]

Sent Copy of Report to [Incident Mgr]
)
SendInput, %mOutage%
return

;<summary>Stations Ticket</summary>
;<remarks>todo</remarks>
^Numpad1::
mStations=
(
User ID:
User Name: 
Airport:
Station ID:
IP / Network Drop:
Contact Phone:
Problem / Issue:
)
SendInput, %mStations%
return

;@Top of ticket template.
^Numpad0::
mNameId=
(
[EmployeeID]
[FirstNameLastName]
)
SendInput, %mNameId%
return


;<summary>Password Reset</summary>
;<remarks>todo</remarks>
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
;<remarks>todo</remarks>
::.navitaire::
pass=
(
User requests password reset for Navitaire. Unlocked Account / Reset Password.
)
SendInput, %pass%
return


;<summary>Password Reset Request GoNow</summary>
;<remarks>todo</remarks>
::.gonow::
pass=
(
User requests password reset for Navitaire GoNow. Unlocked Account / Reset Password.
)
SendInput, %pass%
return


;<summary>Password Reset Reuest Skyspeed</summary>
;<remarks>todo</remarks>
::.skyspeed::
pass=
(
User requests password reset for Navitaire Skyspeed. Unlocked Account / Reset Password.
)
SendInput, %pass%
return


;<summary>Password Reset Reuest LMC</summary>
;<remarks>todo</remarks>
::.lmc::
pass=
(
User requests password reset for Loyalty Management Console. Unlocked Account / Reset Password.
)
SendInput, %pass%
return


;<summary>Password Reset Request Schoox</summary>
;<remarks>todo</remarks>
::.schoox::
pass=
(
User requests password reset for SchooX. Unlocked Account / Reset Password.
)
SendInput, %pass%
return


;<summary>Password Reset Request Vistair</summary>
;<remarks>todo</remarks>
::.vistair::
pass=
(
User requests password reset for Vistair. Unlocked Account / Reset Password.
)
SendInput, %pass%
return


;@Password Reset Request Active Directory
;<summary>Password Reset Request Active Directory</summary>
;<remarks>todo</remarks>
::.ad::
pass=
(
User requests password reset for ActiveDirectory. Unlocked Account / Reset Password.
)
SendInput, %pass%
return


;@Password Reset Request Ultipro
;<summary>Password Reset Request Active Ultipro</summary>
;<remarks>todo</remarks>
::.ultipro::
pass=
(
User requests password reset for Ultipro. Unlocked Account / Reset Password.
)
SendInput, %pass%
return


;<summary>Password Reset Request NetTracer</summary>
;<remarks>todo</remarks>
::.nettracer::
pass=
(
User requests password reset for NetTracer.
Unlocked Account / Reset Password
Verified Access.
)
SendInput, %pass%
return

;<summary>Directed to FLICA support.</summary>
;<remarks>todo</remarks>
::.flica::
flica=
(
User requests assistance accessing Flica. Informed user to contact Flica support at 1-800-659-9859.
)
SendInput, %flica%
return

;<summary>CrewTrac Support</summary>
;<remarks>todo</remarks>
::.crewtrac::
crewtrac=
(
User requests assistance accessing CrewTrac.
Informed user to contact CrewTrac support at crewschedulingsupervisors@flyfrontier.com or 720-374-4540.
)
SendInput, %crewtrac%
return

;<summary>AvioBook/EFB</summary>
;<remarks>todo</remarks>
::.efb::
efb=
(
User requests assistance with AvioBook/EFB beyond logging in.
Informed user to contact EFB at 720-295-7478.
)
SendInput, %efb%
return

;<summary>flytab support</summary>
;<remarks>todo</remarks>
::.flytab::
flytab=
(
User requests assistance with their FlyTab.
Informed user to contact Reatail In Motion support at 888-270-1510.
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
User requests assistance accessing ID90. Assisted user in recovering password via ID90Travel.com login page.
)
SendInput, %id90%
return


;<summary>Password Reset Request myidtravel</summary>
;<remarks>todo</remarks>
::.idtravel::
idtravel=
(
User requests assistance with MyIDTravel beyond signing in. Verified user is using 6 digit employee id. Assisted user in recovering password via myidtravel.com login page. Walked user through setting up new password.
)
SendInput, %idtravel%
return

;<summary>MS Authenticator assistance</summary>
;<remarks>todo</remarks>
::.msauth::
msAuthen=
(
User requesting assistance with MS Authenticator Setup / Access. Walked user through setup process.
)
SendInput,%msAuthen%
return


;<summary>VPN Assistance</summary>
;<remarks>todo</remarks>
::.vpn::
vpn=
(
User requests assistance connecting to VPN. Assisted user in connecting via Citrix.
)
SendInput, %vpn%
return


;<summary>Network Share Access Reques</summary>
;<remarks>todo</remarks>
::.share::
share=
(
User requests [Read/Read Write] Access to the following Network Share
[\\Network-Share\Acccess]
Approved by [Leadership]
)
SendInput, %share%
return

;<summary>Bse Email Template</summary>
;<remarks>todo</remarks>
::.eml::
eml=
(
Hello [...]
 Thanks for contacting the IT helpdesk. I will happy to assist you with your [issue] today.
 [body]
 Please let me know if you have any other questions.
)
SendInput, %eml%
return


;@Email Password Reply
;<summary>Email Password Reset Request</summary>
;<remarks>todo</remarks>
::.epass::
epass= 
(
Hello [...]
 Thanks for contacting the IT helpdesk. I will happy to assist you with your Password Reset today.
 I've unlocked the account and reset the password. Your user name and temporary password for [system] will be:
	[username]
	[password]
 Please let me know if you have any other questions.
)
SendInput, %epass%

return

;@Email Authenticator
;<summary>Todo</summary>
;<remarks>todo</remarks>
::.eauthen::
eauthen=
(
Hello [...]
- Thanks for contacting the IT helpdesk. I will happy to assist you with your MS Authenticator today. First we need to be sure that your entering the correct information into the correct screen.
- The Microsoft Authenticator Sign in page is branded for Frontier Airlines and can be identified by a photo of a Jet Engine in the background. For this system you user name will be your FlyFrontier.com Email address or your Windows Sign-in name with @flyfrontier.com attached to the end.
- The password will be the same password that you use to log on to Windows on the Frontier Airlines Network and the same password you use to log onto MyFrontier.org. All of these passwords are synchronized so if you change one, all of the others change as well.
- Once signed in, you may be presented with prompts for "More information required". If you do, please follow the onscreen instructions to complete the Authenticator setup. You will need to have a mobile phone that authenticator can send messages to, or  that you have installed the Authenticator Mobile App to.
Please let me know if you have any other questions.
)
SendInput, %eauthen%
return


;@Email More Info
;<summary>Todo</summary>
;<remarks>todo</remarks>
::.einfo::
einfo=
(
Hello [...],
Thanks for contacting the IT Support Help Desk, I’m happy to assist you with this issue. In order to do so I’m going to need to collect some more information. 
-- Your Employee ID Number / Sign in name
-- What is the name of the system that you are trying to access?
-- Where are you physically located?
-- Are you using a Frontier Airlines Laptop or Workstation, or are you using personal equipment?
---- If on Frontier equipment – What is the Computer Name (located on a label near the lower right hand corner of the monitor) or IP Address (located on the desktop background)?
-- Are you Connected to a Frontier Airlines Network or is it a personal ISP?
-- Are other employees effected?
-- The Employee ID Number / Sign in name and the First and Last Names of any of the other effected employees.
)

SendInput, %einfo%
return

;@ProsafeT activation
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

;@Single Sign On
;<summary>Single Sign On Assistance.</summary>
;<remarks>todo</remarks>
::.sso::
sso=
(
User's account in this service is Single Sign On.
Advised user access this service via the employee portal: MyFrontier.org
)
SendInput, %sso%
return

;@reactivation
;<summary>Navataire Reactivation</summary>
;<remarks>todo</remarks>
::.react::
react=
(
Account Disabled... Authorization for reactivation provided by [SupervisorName] - [SupervisorID].
)
SendInput, %react%

return


;@Password Requirements
;<summary>Password Complexity Requirements</summary>
;<remarks>todo</remarks>
::.passreq::
(
SendInput, Your new password is required to be at-least 8 characters long, it must include at-least one capitol letter, one lowercase letter, one number and one special character. It must not contain your name or a password that has been used before.
)
return

;@Account Inactive
;<summary>AD Account Inactive</summary>
;<remarks>todo</remarks>
::.inact::
pass=
(
User AD account inactive - reactivated.
)
SendInput, %pass%
return
