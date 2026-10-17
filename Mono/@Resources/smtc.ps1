# Prints "Title - Artist" of the current Windows media session (browsers included), playing or paused. Empty when no session.
# Read-only query of Windows' own media controls; no network, no files written.
[Console]::OutputEncoding = New-Object System.Text.UTF8Encoding $false
try {
  Add-Type -AssemblyName System.Runtime.WindowsRuntime
  $at = ([System.WindowsRuntimeSystemExtensions].GetMethods() | Where-Object { $_.Name -eq 'AsTask' -and $_.GetParameters().Count -eq 1 -and $_.GetParameters()[0].ParameterType.Name -eq 'IAsyncOperation`1' })[0]
  function Await($op, $t) { $task = $at.MakeGenericMethod($t).Invoke($null, @($op)); $task.Wait(-1) | Out-Null; $task.Result }
  [void][Windows.Media.Control.GlobalSystemMediaTransportControlsSessionManager, Windows.Media.Control, ContentType = WindowsRuntime]
  $m = Await ([Windows.Media.Control.GlobalSystemMediaTransportControlsSessionManager]::RequestAsync()) ([Windows.Media.Control.GlobalSystemMediaTransportControlsSessionManager])
  $s = $m.GetCurrentSession()
  if ($s) {
    $p = Await ($s.TryGetMediaPropertiesAsync()) ([Windows.Media.Control.GlobalSystemMediaTransportControlsSessionMediaProperties])
    ($p.Title, $p.Artist | Where-Object { $_ }) -join ' - '
  }
} catch {}
