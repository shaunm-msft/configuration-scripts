$outputPath = "$env:ProgramData\vmssInstall\AzurePsModuleInstall.log"
$nl = [Environment]::NewLineNewLine
New-Item -ItemType Directory -Force -Path $env:ProgramData\vmssInstall
[IO.File]::WriteAllText($outputPath, "Attempting to install Azure PowerShell modules.$nl")
if (!(Test-Path z:\))
{
    $isInstalled = Get-Module -ListAvailable -Name AzureRm
    [IO.File]::AppendAllText($outputPath, "$isInstalled = Get-Module -ListAvailable -Name AzureRm$nl")
	if (!$isInstalled)
	{
		$psrepo = Get-PSRepository
		[IO.File]::AppendAllText($outputPath, "$psrepo = Get-PSRepository$nl")

		$installedModule = Install-Module -Name AzureRm -Force
		[IO.File]::AppendAllText($outputPath, "$installedModule = Install-Module -Name AzureRm -Force$nl")
	}
}
[IO.File]::AppendAllText($outputPath, "Done installing Azure PowerShell modules.$nl")
