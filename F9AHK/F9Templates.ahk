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
