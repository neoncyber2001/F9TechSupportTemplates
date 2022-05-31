;;MAJOR INCIDENT TEMPLATE

	;;;;;;;;;;;;;;;;;;;;
	;;This template will be used to create
	;;uniform tickets for Major Incidents and
	;;there resolutions.
	;;;;;;;;;;;;;;;;;;;;





::.mim::
mim = User calling to report outage in Citrix and VPN - Advised that Major Insident Management has been notified Ticket... %mim_ticket%
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
Sleep, 250
Send, %mim_ticket%
Sleep, 250
return

^Numpad7::
Sleep, 250
Send, %mim_ticket%
Sleep, 250
return

