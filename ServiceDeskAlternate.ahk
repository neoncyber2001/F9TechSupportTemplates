;THIS IS THE TESTING VERSION.... PARTS OF THIS SCRIPT MAY BE BROKEN
;Frontier IT Service Desk AHK Template Script v0.0.0.5d
;Tested on Version AutoHotkey 1.1.33.10
;Use CTRL+SHIFT+? for help.
;


;;;;;;;;;;;;;;;;
;@Default Customer Entry
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
;@Outage Report
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


;@Password Reset Request
::.pass::
pass=
(
User requests password reset for [System].
Unlocked Account / Reset Password
Verified Access.
)
SendInput, %pass%
return


;@Password Reset Request Navitaire
::.navitaire::
pass=
(
User requests password reset for Navataire.
Unlocked Account / Reset Password
Verified Access.
)
SendInput, %pass%
return


;@Password Reset Request Navitaire
::.gonow::
pass=
(
User requests password reset for Navataire GoNow.
Unlocked Account / Reset Password
Verified Access.
)
SendInput, %pass%
return


;@Password Reset Request Navitaire
::.skyspeed::
pass=
(
User requests password reset for Navataire Skyspeed.
Unlocked Account / Reset Password
Verified Access.
)
SendInput, %pass%
return


;@Password Reset Request LMC
::.lmc::
pass=
(
User requests password reset for Loyalty Management Console.
Unlocked Account / Reset Password
Verified Access.
)
SendInput, %pass%
return


;@Password Reset Request Schoox
::.schoox::
pass=
(
User requests password reset for SchooX.
Unlocked Account / Reset Password
Verified Access.
)
SendInput, %pass%
return


;@Password Reset Request Vistair
::.vistair::
pass=
(
User requests password reset for Vistair.
Unlocked Account / Reset Password
Verified Access.
)
SendInput, %pass%
return


;@Password Reset Request Active Directory
::.ad::
pass=
(
User requests password reset for ActiveDirectory.
Unlocked Account / Reset Password
Verified Access.
)
SendInput, %pass%
return


;@Password Reset Request Ultipro
::.ultipro::
pass=
(
User requests password reset for Ultipro.
Unlocked Account / Reset Password
Verified Access.
)
SendInput, %pass%
return


;@Flica Support
::.flica::
flica=
(
User requests assistance accessing Flica.
Informed user to contact Flica support at 1-800-659-9859.
)
SendInput, %flica%
return


;@CrewTrac Support
::.crewtrac::
crewtrac=
(
User requests assistance accessing CrewTrac.
Informed user to contact CrewTrac support at crewschedulingsupervisors@flyfrontier.com or 720-374-4540.
)
SendInput, %crewtrac%
return


;@AvioBook/EFB
::.efb::
efb=
(
User requests assistance with AvioBook/EFB beyond logging in.
Informed user to contact EFB at 720-295-7478.
)
SendInput, %efb%
return


;@FlyTab
::.flytab::
flytab=
(
User requests assistance with their FlyTab.
Informed user to contact Reatail In Motion support at 888-270-1510.
)
SendInput, %flytab%
return


;@Trax
::.trax::
trax=
(
User requests password reset for Trax.
Informed user to contact Trax support at TraxBusAdmin@flyfrontier.com.
)
SendInput, %trax%
return


;@ID90
::.id90::
id90=
(
User requests assistance accessing ID90.
Informed user to contact ID90 support at 877-298-5233.
)
SendInput, %id90%
return


;@MyIDTravel.com
::.idtravel::
(
User requests assistance with MyIDTravel beyond signing in.
Informed user to contact MyIDTravel support at F9pass@flyfrontier.com for further assistance.
)
SendInput, %idtravel%
return


;@Authenticator
::.msauth::
msAuthen=
(
User requesting assistance with MS Authenticator Setup / Access. Walked user through setup process.
)
SendInput,%msAuthen%
return


;@VPN Connection
::.vpn::
vpn=
(
User requests assistance connecting to VPN. Assisted user in connecting via Citrix.
)
SendInput, %vpn%
return


;@Name:NetworkShare Access
;@hk
::.share::
share=
(
User requests [Read/Read Write] Access to the following Network Share
[\\Network-Share\Acccess]
Approved by [Leadership]
)
SendInput, %share%
return

;@hr
;@Email Template Generric
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
::.sso::
sso=
(
User's account in this service is Single Sign On.
Advised user access this service via the employee portal: MyFrontier.org
)
SendInput, %sso%
return

;@reactivation
::.react::
react=
(
Account Disabled... Authorization for reactivation provided by [SupervisorName] - [SupervisorID].
)
SendInput, %react%

return


;@Password Requirements
::.passreq::
(
SendInput, Your new password is required to be at-least 8 characters long, it must include at-least one capitol letter, one lowercase letter, one number and one special character. It must not contain your name or a password that has been used before.
)
return

;@Account Inactive
::.inact::
pass=
(
User account inactive - reactivated.
)
SendInput, %pass%
return
