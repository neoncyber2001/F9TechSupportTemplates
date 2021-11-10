# F9TechSupportTemplates

In order to use these scripts you must have a copy of AutoHotkey v1.1.33 or later. The current version of AutoHotkey can be downloaded here: https://www.autohotkey.com/

Technical Support Auto Hotkey Scripts and Ticket Template for Frontier IT Service Desk.

There are two scripts currently...

*	FrontierITServiceDesk.AHK

*	FrontierITServiceDeskAlternate.AHK

## FrontierITServiceDesk.AHK

This version of the IT Service Desk Hotkey file operates with a Key Combination Sequence.

For a fast help dialog press Control+Shift+?

First be sure that your cursor is in the "Description" field in Cherwell and press Control+Shift+1. at that point a ToolTip will appear near your cursor with a list of available templates. Press the number that corrisponds with the desired template.

For email templates your will use Control+Shift+2

After the initial key combo you have 3 seconds to enter your template selection number. when template selection is nolonger available you will hear a beep.

## FrontierITServiceDeskAlternate.AHK

For ease of mantainance and to encourage expansion by other agents new version of the support template script is being written which is easier to read and use.

### To quickly enter the Default Customer in Cherwell

With your cursor in the "Customer" field.
*	Press Control+(Numpad .)

### Base Templates and Data Collection

Control+Numpad0

	\[EmployeeID\]
	\[FirstNameLastName\]


-------------------------------------------
Stations Support Data Collection Template

Control+Numpad1

	User ID:
	User Name:
	Airpoart:
	Station ID:
	IP / NetworkDrop:
	Contact Phone:
	Problem / Issue:
	
	
-------------------------------------------
Outage or Flight Delay Data Collection Template

Control+Numpad5	

	Reporting Location: \[Call Center / Department\]
	By: \[FirstNameLastName\] - \[EmployeeID\]
	Contact: \[Phone and/or Email\]
	1.What is down? \[System Name\]
	2.What are users unable to do? \[eg: Refunds, Book Flights\]
	3.What location(s) are impacted? \[Physical Location\]
	4.Does this cause any impact to any flights and what flights are impacted? \[Estimated Imact / Delays\]
	5.If there are no flights impacted; does this issue have any financial impact? \[Estimated Financial Impact\]
	6. What is the public IP address of the agents seeing the issue? \[PublicIP via https://www.whatismyip.com/ \]
	7. Please send screenshots of any error messages that you are receiving. \[see attached\]
	Sent Copy of Report to \[Incident Mgr\]
	
### Hotstrings
The script uses "hotstrings" to automatically enter portions of template as you are typing. Each hotstring will begin with a "." and end with a sopace " ".

-------------------------------------------
.pass

	User requests password reset for \[System\]. Unlocked Account / Reset Password, Verified Access.
	
-------------------------------------------
.ad

	User requests password reset for ActiveDirectory.
	Unlocked Account / Reset PasswordVerified Access.
	
-------------------------------------------
.navataire
	
	User requests password reset for Navataire.	Unlocked Account / Reset PasswordVerified Access.
	
-------------------------------------------
.gonow
	
	User requests password reset for Navataire GoNow.
	Unlocked Account / Reset PasswordVerified Access.
	
-------------------------------------------
.skyspeed
	
	User requests password reset for Navataire Skyspeed.
	Unlocked Account / Reset PasswordVerified Access.
	
	
-------------------------------------------
.schoox
	
	User requests password reset for SchooX.
	Unlocked Account / Reset PasswordVerified Access.
	
-------------------------------------------
.vistair

	User requests password reset for Vistair.
	Unlocked Account / Reset PasswordVerified Access.
	
-------------------------------------------
.ultipro

	User requests password reset for Ultipro.
	Unlocked Account / Reset PasswordVerified Access.
	
-------------------------------------------
.flica
	
	User requests assistance accessing Flica.
	Informed user to contact Flica support at 1-800-659-9859.
	
-------------------------------------------
.crewtrac
	
	User requests assistance accessing CrewTrac.
	Informed user to contact CrewTrac support at crewschedulingsupervisors@flyfrontier.com or 720-374-4540.
	
-------------------------------------------
.efb
	
	User requests assistance with AvioBook/EFB beyond logging in.
	Informed user to contact EFB at 720-295-7478.
	
-------------------------------------------
.flytab

	User requests assistance with their FlyTab.
	Informed user to contact FlyTab support at 888-270-1510.
	
-------------------------------------------
.trax

	User requests password reset for Trax.
	Informed user to contact Trax support at TraxBusAdmin@flyfrontier.com.
	
-------------------------------------------
.id90

	User requests assistance accessing ID90.
	Informed user to contact ID90 support at 877-298-5233.
	
-------------------------------------------
.idtravel

	User requests assistance with MyIDTravel beyond signing in. Informed user to contact MyIDTravel support at F9pass@flyfrontier.com for further assistance. 
	
-------------------------------------------
.react
	
	User deactivated, Reactivation approval provided by \[SupervisorName\] - \[SupervisorID\].

-------------------------------------------
.msauth

	User requesting assistance with MS Authenticator Setup / Access. Walked user through setup process.
	
-------------------------------------------
.share
	
	User requests \[Read/Read Write\] Access to the following Network Share	\[\\\\Network-Share\\Acccess\]
	Approved by \[Leadership\]
	
-------------------------------------------
TODO: Email templates
