param (
    [string]$DESTHOST="www.google.com",
    [string]$DESTPORT="80"
)

(Test-NetConnection -ComputerName $DESTHOST -Port $DESTPORT).TcpTestSucceeded