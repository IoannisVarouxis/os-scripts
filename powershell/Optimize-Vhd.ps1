param(
    [Parameter(Mandatory=$True)] $VMName,
    [Parameter(Mandatory=$False)] $VhdxFile = ""
)

$VM = Get-VM -VMName $VMName

If ($VM.State -eq "Off") {
    Write-Host -ForegroundColor Yellow "For Widnows VMs run Defrag tool and then 'sdelete -z' to zero out all unused blocks"
    Write-Host -ForegroundColor Yellow "For LInux VMs run 'fstrim -a -v' first in all file systems"
    Write-Host
    
    If ($VM.HardDrives.Count -gt 0) {
        If ($VhdxFile -eq "") {
            $VhdxFile = $VM.HardDrives[0].Path
            Write-Host -ForegroundColor Yellow "Auto-select first virtual hard drive: $VhdxFile"
        }
        If (Test-Path -Path $VhdxFile) {
            Mount-VHD -Path $VhdxFile -ReadOnly
            Optimize-VHD -Path $VhdxFile -Mode Full
            Dismount-VHD -Path $VhdxFile
        }
    } else {
        Write-Host -ForegroundColor Red "VM has no virtual hard drives defined"
    }
} else {
    Write-Host -ForegroundColor Red "VM must be shutdown"
}
