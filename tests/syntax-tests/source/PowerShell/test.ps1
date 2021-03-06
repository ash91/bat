# PowerShell script for testing syntax highlighting

function Get-FutureTime {
    param (
        [Int32] $Minutes
    )
    
    $time = Get-Date | % { $_.AddMinutes($Minutes) }
    "{0:d2}:{1:d2}:{2:d2}" -f @($time.hour, $time.minute, $time.second)
}

if ($env:PATH -match '.*rust.*') {
   'Path contains Rust'
    try {
        & "cargo" "--version"
    } catch {
        Write-Error "Failed to run cargo"
    }
} else {
   'Path does not contain Rust'
}

(5..30) | ? { $_ % (2 * 2 + 1) -eq 0 } | % {"In {0} minutes, the time will be {1}." -f $_, $( Get-FutureTime $_ )}
$later =  Get-FutureTime -Minutes $( Get-Random -Minimum 60 -Maximum 120 )
"The time will be " + $later + " later."
