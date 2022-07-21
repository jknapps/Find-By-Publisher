function FindbyPublisher {
    param (
        [string] $Publisher = "DoNotMatchAnythingByDefault",
        [string] $DisplayName = "DoNotMatchAnythingByDefault"
    )
    $selected =
    Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ |
                        
        Get-ItemProperty |
        Where-Object { ($_.Publisher -like "*$Publisher*" -or $_.DisplayName -like "*$DisplayName*") -and $_.displayname -ne -$null}|
        Select-Object -Property DisplayName, Publisher, InstallDate, DisplayVersion, Version, UninstallString, QuietUninstallString, PSPath, IdentifyingNumber, ProductVersion | Out-GridView -PassThru
    $selected | clip.exe
    $selected
}