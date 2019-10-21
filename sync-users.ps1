$ErrorActionPreference = "Stop"
[xml]$Config = Get-Content .\sync-users.config

If(!$Config.Sync.BasicAuthUser) { $Config.Sync.BasicAuthUser = "" }
If(!$Config.Sync.BasicAuthPass) { $Config.Sync.BasicAuthPass = "" }

$Token = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($Config.Sync.BasicAuthUser + ":" + $Config.Sync.BasicAuthPass))

$Url = $Config.Sync.HostUrl + "/api/v1/sync/users"

$Head = @{
"Authorization"="Basic $Token"
}

$Body = @{}

[System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

try {
	Invoke-RestMethod -Uri $Url -Method POST -Body $Body -ContentType "application/json" -Headers $Head
}
catch {
    $_.Exception | Format-List -Force
}