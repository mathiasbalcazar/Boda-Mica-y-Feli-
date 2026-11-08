param([int]$Port = 8090, [string]$Root = (Split-Path $PSScriptRoot -Parent))
# Uso: powershell -ExecutionPolicy Bypass -File extras\servidor.ps1   y abrir http://localhost:8090/
$types = @{ '.html'='text/html; charset=utf-8'; '.css'='text/css'; '.js'='application/javascript'; '.jpg'='image/jpeg'; '.jpeg'='image/jpeg'; '.png'='image/png'; '.svg'='image/svg+xml'; '.mp4'='video/mp4'; '.webm'='video/webm'; '.mp3'='audio/mpeg'; '.ico'='image/x-icon' }
$l = New-Object System.Net.HttpListener
$l.Prefixes.Add("http://localhost:$Port/")
$l.Start()
Write-Host "Sirviendo $Root en http://localhost:$Port/"
while ($l.IsListening) {
  $c = $l.GetContext()
  try {
    $p = [Uri]::UnescapeDataString($c.Request.Url.AbsolutePath).TrimStart('/')
    if ($p -eq '' -or $p.EndsWith('/')) { $p += 'index.html' }
    $f = [IO.Path]::GetFullPath((Join-Path $Root $p))
    if ($f.StartsWith([IO.Path]::GetFullPath($Root)) -and (Test-Path $f -PathType Leaf)) {
      $b = [IO.File]::ReadAllBytes($f)
      $ext = [IO.Path]::GetExtension($f).ToLower()
      $c.Response.ContentType = if ($types[$ext]) { $types[$ext] } else { 'application/octet-stream' }
      $c.Response.ContentLength64 = $b.Length
      $c.Response.OutputStream.Write($b, 0, $b.Length)
    } else { $c.Response.StatusCode = 404 }
  } catch { } finally { $c.Response.Close() }
}
