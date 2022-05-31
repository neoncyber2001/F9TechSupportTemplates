;;MAJOR INCIDENT TEMPLATE

	;;;;;;;;;;;;;;;;;;;;
	;;This template will be used to create
	;;uniform tickets for Major Incidents and
	;;there resolutions.
	;;;;;;;;;;;;;;;;;;;;

::.mim::
mim=
(
User calling to report outage in Citrix and VPN - Advised that Major Insident Management has been notified - Ticket 1116222.  
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

::#mim::
Send, 1116222
return