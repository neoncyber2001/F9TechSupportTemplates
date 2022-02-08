;MAJOR INCIDENT TEMPLATE


;;;;;;;;;;;;;;;;;;;;
;;This template will be used to create
;;uniform tickets and 
;;;;;;;;;;;;;;;;;;;;
::.mi.call::
major=
(
No Major Insidents at this time.
)
SendInput, %major%
return


::.mi.resolved::
major=
(
User states that he has an issue with VPN. User name and password not accepted. Advised issue with VPN was reported resolved by SOC. Asked user to log off and back on. Confirmed user can now successfully login. 
)
SendInput, %major%
return