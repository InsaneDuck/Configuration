# Get a list of all installed apps
$installedApps = Get-AppxPackage

# Define a list of bloatware apps to remove
$bloatwareApps = @(
  "Microsoft.3DBuilder",
  "Microsoft.BingFinance",
  "Microsoft.BingNews",
  "Microsoft.BingSports",
  "Microsoft.BingWeather",
  "Microsoft.Microsoft3DViewer",
  "Microsoft.MicrosoftOfficeHub",
  "Microsoft.MicrosoftSolitaireCollection",
  "Microsoft.Office.OneNote",
  "Microsoft.SkypeApp",
  "Microsoft.WindowsAlarms",
  "Microsoft.WindowsCalculator",
  "Microsoft.WindowsCamera",
  "Microsoft.WindowsMaps",
  "Microsoft.WindowsPhone",
  "Microsoft.WindowsSoundRecorder"
  "Microsoft.People"
)

# Iterate over the list of installed apps and remove the bloatware apps
foreach ($app in $installedApps) {
  if ($bloatwareApps -contains $app.Name) {
    Remove-AppxPackage -Package $app.PackageFullName
  }
}

# Install the winget command-line tool if it is not already installed
#if (!(Get-Command winget -ErrorAction SilentlyContinue)) {
#    Invoke-WebRequest -Uri https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.Windows.Winget.CLI.zip -OutFile winget.zip
#    Expand-Archive winget.zip -DestinationPath "$env:ProgramFiles\WindowsApps"
#    Remove-Item winget.zip
#}

# Define an array of programs to install
$programs = @(
    "Microsoft.VisualStudioCode", 
    "Tonec.InternetDownloadManager", 
    "Mozilla.Firefox",
    "Valve.Steam",
    "OpenJS.NodeJS",
    "Oracle.JDK.17",
    "ThePBone.GalaxyBudsClient",
    "qBittorrent.qBittorrent",
    "7zip.7zip",
    "Discord.Discord",
    "Google.Drive",
    "Google.Chrome",
    "Git.Git",
    "TheDocumentFoundation.LibreOffice",
    "JetBrains.Toolbox",
    "SumatraPDF.SumatraPDF",
    "VideoLAN.VLC")

# Install each program silently using winget
foreach ($program in $programs) {
    winget install -e --id $program
}

