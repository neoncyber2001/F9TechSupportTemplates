;;MAJOR INCIDENT TEMPLATE

	;;;;;;;;;;;;;;;;;;;;
	;;This template will be used to create
	;;uniform tickets for Major Incidents and
	;;there resolutions.
	;;;;;;;;;;;;;;;;;;;;

miCheck(){
	MsgBox, No Currently Active Major Incidents.
	Return
}

insertMIM(){
	miOut=
	(
	Nope - Ticket 00000.  
	)
	Sleep, 250
	BlockInput, On
	Send, %miOut%
	BlockInput, off
	Return
}

insertMITicket(){
	Sleep, 250
	Send, 00000
	Return
}