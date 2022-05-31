;;MAJOR INCIDENT TEMPLATE

	;;;;;;;;;;;;;;;;;;;;
	;;This template will be used to create
	;;uniform tickets for Major Incidents and
	;;there resolutions.
	;;;;;;;;;;;;;;;;;;;;

::.mim::
mim=
(
<<<<<<< HEAD
User calling to report outage in Citrix and VPN - Advised that Major Insident Management has been notified - Ticket 1116322.  
=======
User calling to report outage in Citrix and VPN - Advised that Major Insident Managemenmt has been notified - Ticket 1116222.  
>>>>>>> bc89cc1c139976ba9bc628dbe6f0d6ed46aa1538
)
Sleep, 250
BlockInput, On
Send, %mim%
;Sleep, 500
;Send, {Tab}{Tab}Citrix
;Sleep, 250
;Send, {Tab}{Enter}
BlockInput, off
return
