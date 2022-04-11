param (
    [string]$DESTHOST="www.google.com"
)

(Test-NetConnection -ComputerName $DESTHOST).PingSucceeded