RestGET(resource, options="")
{
    oWhr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    oWhr.Open("GET", %resource%, false)
    oWhr.SetRequestHeader("Content-Type", "application/json")
    if (options){
        oWhr.SetRequestHeader("F9Options", %options%)
    }
    oWhr.Send()
    return oWhr.ResponseText
}

RestPOST(resource, body="")
{
    oWhr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    oWhr.Open("GET", %resource%, false)
    oWhr.SetRequestHeader("Content-Type", "text/plain")
    If (options){
        oWhr.SetRequestHeader("F9Options", %options%)
    }

    If (body)
    {
        oWhr.Send(body)
    }
    Else
    {
        oWhr.Send()
    }
}