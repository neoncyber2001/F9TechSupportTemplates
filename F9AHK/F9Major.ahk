;;MAJOR INCIDENT TEMPLATE

	;;;;;;;;;;;;;;;;;;;;
	;;This template will be used to create
	;;uniform tickets for Major Incidents and
	;;there resolutions.
	;;;;;;;;;;;;;;;;;;;;

::.mim::
mim=
(
User calling to report outage in Citrix.  Major Insident Managemenmt has been notified - Ticket 1116322.  
)
Sleep, 250
BlockInput, On
Send, %pasmims%
;Sleep, 500
;Send, {Tab}{Tab}Citrix
;Sleep, 250
;Send, {Tab}{Enter}
BlockInput, off
return