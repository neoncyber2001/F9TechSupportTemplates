defaultCustomer()
{
    BlockInput, On
	Sleep, 250
	Send, Default Customer{Tab}
	Sleep, 1000
	Send, {Enter}
	Sleep, 1000
	Send, {Enter}
	BlockInput, Off
    return
}


issueResolved()
{
Sleep, 250
Send, Issue Has Been Resolved.
return
}


outageReport()
{
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
}

stationsRequest()
{
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
}

schooxReset()
{    
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
}

vistairReset()
{
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
}

adReset(){
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
}

navitaireReset(){
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
}

ultiproReset()
{
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
}

nettracerReset()
{
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
}

flicaReset()
{
    flica=
    (
    User attempting to access FLICA.
    User requests assistance accessing Flica. Informed user to contact Flica support at 1-800-659-9859.
    )
    Send, %flica%
    return
}


crewtracReset()
{
    crewtrac=
    (
    User requests assistance with CrewTrac Username and Password.
    Informed user to contact CrewTrac support at crewschedulingsupervisors@flyfrontier.com or 720-374-4540.
    )
    Send, %crewtrac%
    return
}

efbInstall()
{
    efb=
    (
    User requests assistance with AvioBook/EFB.
    Informed user to contact EFB at 720-295-7478.
    )
    Send, %efb%
    return
}

efbReinstall(){
    efb=
    (
    User requests assistance with AvioBook/EFB reinstall.
    Informed user to contact EFB at 720-295-7478.
    )
    Send, %efb%
    return
}

efbPasswordReset(){
    efb=
    (
    User requests assistance with AvioBook/EFB Password.
    Reset user's password in Active Directory, advised user that all AD passwords will be reset aswell.
    )
    Send, %efb%
    return
}


flytabConfig(){
    flytab=
    (
    User requests assistance with their FlyTab, [SpecificIssue].
    Directed user to contact Reatail In Motion support at 888-270-1510.
    )
    Send, %flytab%
    return
}

traxReset(){
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
}


expiredAccount(){
    expired=
    (
    Contractor AD account expired. Directed user to contact their frontier manager for reactivation in Contractor Portal.
    )
    Send, %expired%
    return
}

id90Reset()
{
    id90=
    (
    User requests assistance accessing ID90, [SpecificIssue].
    Assisted user in recovering password via ID90Travel.com login page.
    )
    Send, %id90%
    return
}

idTravelReset(){
    idtravel=
    (
    User requests assistance with MyIDTravel Login.
    Verified user is using 6 digit employee id. Assisted user in recovering password via myidtravel.com login page. Walked user through setting up new password.
    )
    Send, %idtravel%
    return
}

mfaSetup(){
    msAuthen=
    (
    User requesting assistance with MS Authenticator Setup
    Walked user through process of setting up MS Authenticator account. Advised user that they must have there Authentication Device with them when logging into a Frontier system incase authentication is required.
    )
    Send,%msAuthen%
    return
}


vpnConnect(){   
    vpn=
    (
    User requests assistance connecting to VPN.
    Assisted user in connecting secureid.myfrontier.org.
    )
    Send, %vpn%
}

vpnIssue(){
    vpn=
    (
    User is calling to report a VPN issue.
    Specific Issue:
    Troubleshooting:
    Resolution: [Resolved / Escalated to]
    )
    Send, %vpn%
    return
}

netShare(){
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
}

citrixAppRequest()
{
    app=
    (
    User is calling to request access to a software within Citrix.
    Software Name(s): [Software-Names]
    AD Group Name(s): [Group-Names].
    )
    Sleep, 250
    BlockInput, On
    Send, %app%
    Send, {Enter}Approved by [Leadership]
    Sleep, 500
    Send, {Tab}{Tab}Citrix Application Access
    Sleep, 250
    Send, {Tab}{Enter}
    BlockInput, Off
    return
}

softwareInstall(){
    share=
    (
    User is calling to request installation of software [AppNameHere].
    Is a licence required: [Yes/No]
    Approved by [Leadership]
    Request sent to [Agent] in [Department] for deployment.
    )
    Send, %share%
}

prosafe(){
    code=
    (
    User is requesting the activation code for ProSafeT. 
    Provided activation code 4D25-BE28-93CA-8088.
    Verified activation.
    )
    Send, %code%
    return
}

ssoAssist(){
    sso=
    (
    User's account in this service is Single Sign On. Advised user how Single Sign on works and how to use it in this app.
    )
    Send, %sso%
    return
}

reactivated(){
    react=
    (
    Navitaire Account Disabled... Authorization for reactivation provided by [SupervisorName] - [SupervisorID].
    )
    Send, %react%
    return
}

adobeUpdate(){
    update=
    (
    User reports that their Adobe [SOFTWARE NAME] is nonfunctional, and requires a software update.

    Assisted user in updating the aforementioned software via Adobe Creative Cloud, the Adobe software hub.
    )
    Send, %update%
    return
}

adobeInstall(){
    install=
    (
    User states that they cannot locate Adobe Creative Cloud - the application needs to be installed.

    Remoted into the user's device via [Dameware/Teams]. Navigated to https://helpx.adobe.com/download-install/kb/creative-cloud-desktop-app-download.html to initate the Creative Cloud installation.

    Opened Registry Editor on the device, navigated to HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\CurrentVersion\InternetSettings, and Security_HKLM_Only key to 0 from 1.
    )
    Send, %install%
    return
}


adobeError(){
    aerror=
    (
    User reports that they are still receiving the Update message when they use their Adobe software, even after the update via Creative Cloud.

    Downloaded Zones.reg onto the agent's computer. Merged the .reg file via Registry Editor.
    )
    Send, %aerror%
}

userInactive(){
    pass=
    (
    inactivity script had run on user's AD Account - reactivated, advised wait 30 min to login.
    )
    Send, %pass%
    return
}


