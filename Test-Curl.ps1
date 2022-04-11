param (
    [string]$DESTHOST="www.google.com",
    [string]$DESTPORT="443",
    [string]$PROTO="https"
)

(Invoke-WebRequest -URI "$PROTO`://$DESTHOST`:$DESTPORT" -UseBasicParsing -TimeoutSec 10).StatusCode -lt 400