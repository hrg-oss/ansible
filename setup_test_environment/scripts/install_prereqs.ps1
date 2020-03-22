# PS Script to install test environment prereqs (virtualbox, vagrant ++)
# arerom@hrg 20032020

# Check if chocolatey is installed, install if not
# Post-install, run choco to install prereqs - modify packages in "prereq_cmd" to your liking if required

$test_choco = powershell choco -v
$prereq_cmd = choco install virtualbox vagrant packer vscode vscode-ansible chocolatey-vscode vscode-yaml vscode-powershell vscode-icons -y

if(-not($test_choco)){
Write-Output "Chocolatey not installed, installing.."
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
Write-Output "Chocolatey installed, now installing environment prerequisites.."
$prereq_cmd
Write-Output "Done!"
}
else{
    Write-Output "Found Chocolatey, installing prerequisites.."
    $prereq_cmd
    Write-Output "Done!"
}