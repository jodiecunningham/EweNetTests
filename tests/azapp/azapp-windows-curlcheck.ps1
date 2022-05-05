Param (
    [string]$ResourceGroupName,
    [string]$AzAppServiceName,
    [string]$DestHost,
    [string]$Proto,
    $DestPort=$null
)

begin { 
    if ($DestPort -gt 0) { 
        [string]$DestPort = ":"+$DestPort
    }
}

process { 
Invoke-WebRequest -URI "https://raw.githubusercontent.com/mobzystems/Kudu-API/master/Kudu-Api.psm1" -OutFile ".\Kudu-Api.psm1"

import-module .\Kudu-Api

[xml]$azprof=Get-AzWebAppPublishingProfile -ResourceGroupName $ResourceGroupName -Name $AzAppServiceName

$azdeploy= $azprof.publishData.publishProfile|where { $_.PublishMethod -eq 'MSDeploy' }

$token = New-KuduAuthorizationToken $azdeploy.userName $azdeploy.userPWD

$site = @{ SiteName = $AzAppServiceName; Token = $token}

Invoke-KuduCommand @site "curl $($Proto)://$($DestHost)$($DestPort)"  "D:\home\"

}