;THIS IS THE TESTING VERSION.... PARTS OF THIS SCRIPT MAY BE BROKEN
;Frontier IT Service Desk AHK Template Script v0.0.0.5d
;Tested on Version AutoHotkey 1.1.33.10
;Use CTRL+SHIFT+? for help.

CherwellTitle = Cherwell Service Management (licensed to Frontier Airlines, Inc.)
CherwellDescr = HwndWrapper[Trebuchet.App.exe;Cherwell 1;63e4bdbe-b1b0-4a10-9351-60a5699525a4]1

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Command Section Summarys ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
CherwellCommandSummary = 
(
Cherwell Templates
1 - Password Reset Template
2 - Authenticator Template
3 - VPN Template
4 - Stations Template
5 - Network Share Access
5 - OLNK Issue Report

0 - Type and select Default Customer
)

EmailCommandSummary = 
(
Email Templates
1 - Generic Email Reply
2 - Password Reset Email
3 - Authenticator Email
4 - General More Info
)

;;;;;;;;;;;;;;;;;;;;;;;
;;Cherwell Templates ;;
;;;;;;;;;;;;;;;;;;;;;;;
CherwellA =
(
[EmployeeID]
[FirstNameLastName]
User requests password reset for [System].
Unlocked Account / Reset Password
Verified Access.
)

CherwellMSAuthen =
(
[EmployeeID]
[FirstNameLastName]
User requests assistance setting up Authenticator. Walked user through setup process. Verified access.
)


CherwellVPN =
(
[EmployeeID]
[FirstNameLastName]
User requests assistance connecting to the VPN. TODO - Write better template.
)

CherwellStns = 
(
User ID:
User Name: 
Airpoart:
Station ID:
IP:
Contact Phone:
Problem / Issue:
)

CherwellOLNKReporting = 
(
User ID:
User Name: 
Location:
Number of Users affected:
What Issues are being reported:
Contact Phone:
User's Email Addresses or PNRs:
)

CherwellNetShare = 
(
[EmployeeID]
[FirstNameLastName]
User requests [Read/Read Write] Access to the following Network Share
[\\Network-Share\Acccess]
Approved by [Leadership]
)

;;;;;;;;;;;;;;;;;;;;;
;; Email Templates ;;
;;;;;;;;;;;;;;;;;;;;;

EmailTmplate =
(
Hello [...]
 Thanks for contacting the IT helpdesk. I will happy to assist you with your [issue] today.
 [body]
 Please let me know if you have any other questions.
)

EmailPassReset =
(
Hello [...]
 Thanks for contacting the IT helpdesk. I will happy to assist you with your Password Reset today.
 I've unlocked your account and reset your password. Your user name and temporary password for [system] will be:
	[username]
	[password]
 Please let me know if you have any other questions.
)
EmailAuthenticator =
(
Hello [...]
- Thanks for contacting the IT helpdesk. I will happy to assist you with your MS Authenticator today. First we need to be sure that your entering the correct information into the correct screen.
- The Microsoft Authenticator Sign in page is branded for Frontier Airlines and can be identified by a photo of a Jet Engine in the background. For this system you user name will be your FlyFrontier.com Email address or your Windows Sign-in name with @flyfrontier.com attached to the end.
- The password will be the same password that you use to log on to Windows on the Frontier Airlines Network and the same password you use to log onto MyFrontier.org. All of these passwords are synchronized so if you change one, all of the others change as well.
- Once signed in, you may be presented with prompts for "More information required". If you do, please follow the onscreen instructions to complete the Authenticator setup. You will need to have a mobile phone that authenticator can send messages to, or  that you have installed the Authenticator Mobile App to.
Please let me know if you have any other questions.
)

EmailMoreInfo =
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Situational Hotstrings for Cherwell info. ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
::.react::
SendInput, Account Disabled... Authorization for reactivation provided by [SupervisorName] - [SupervisorID].
return

::.passreq::
SendInput, Your new password is required to be at-least 8 characters long, it must include at-least one capitol letter, one lowercase letter, one number and one special character. It must not contain your name or a password that has been used before.
return

::.def::
Send, Default Customer
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Fires Cherwell Templates ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
^+1::
ToolTip, %CherwellCommandSummary%
Input, choice, L1 T3, {LControl}{RControl}{LAlt}{RAlt}{LShift}{RShift}{LWin}{RWin}{AppsKey}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{CapsLock}{NumLock}{PrintScreen}{Pause}
if(choice="1")
{
	Sleep, 250
	SendInput, %CherwellA%
}
else if(choice="2")
{
	Sleep, 250
	SendInput, %CherwellMSAuthen%
}
else if(choice="3")
{
	Sleep, 250
	SendInput, %CherwellVPN%
}
else if(choice="4")
{
	Sleep, 250
	SendInput, %CherwellStns%
}
else if(choice="5")
{
	Sleep, 250
	SendInput, %CherwellNetShare%
}
else if(choice="6")
{
	Sleep, 250
	SendInput, %CherwellOLNKReporting%
}
else if(choice="0")
{
	Sleep, 250
	Send, Default Customer{Tab}
	Sleep, 1000
	Send, {Enter}
	Sleep, 1000
	Send, {Enter}
}
else
{
	SoundBeep, 330, 100
	Sleep, 25
	SoundBeep, 220, 100
}
ToolTip
return





;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Fires Email Templates ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

^+2::
ToolTip, %EmailCommandSummary%
Input, eml, L1 T3, {LControl}{RControl}{LAlt}{RAlt}{LShift}{RShift}{LWin}{RWin}{AppsKey}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{CapsLock}{NumLock}{PrintScreen}{Pause}
if(eml="1")
{
	Sleep, 250
	SendInput, %EmailTmplate%
}
else if(eml="2")
{
	Sleep, 250
	SendInput, %EmailPassReset%
}
else if(eml="3")
{
	Sleep, 250
	SendInput, %EmailAuthenticator%
}
else if(eml="4")
{
	Sleep, 250
	SendInput, %EmailMoreInfo%
}
else
{
	SoundBeep, 330, 100
	Sleep, 25
	SoundBeep, 220, 100
}
ToolTip
return



;;;;;;;;;;;;;;;;
;; Help Popup ;;
;;;;;;;;;;;;;;;;

^+/::
txt =
(
Control + Shift + 1 -> and 1 through 4 to access Cherwell Ticket Templates.
Control + Shift + 2 -> and 1 through 3 to access Email Templates.

A ToolTip near your Mouse Pointer will show you the template options available.

The optional or situational snipits are inserted using 'hot-strings' that begin with a period.
.passreq will insert the standard password requirements.
.react will insert a user reactivation template snipit.
.def will insert Default Customer

Warning! NEVER place passwords (even temporary passwords) into a script!
)

MsgBox, 0, HELP, %txt%
return
