$htmlFiles = Get-ChildItem -Path *.html

foreach ($file in $htmlFiles) {
    Write-Host "Processing $($file.Name)..."
    
    # Read the file content
    $content = Get-Content -Path $file.FullName -Raw
    
    # Flag to track if any changes were made
    $changesApplied = $false
    
    # Check if the file already has a favicon link
    if ($content -match '<link [^>]*rel="icon"[^>]*>|<link [^>]*rel="shortcut icon"[^>]*>') {
        # Replace existing favicon link with the new one
        $content = [regex]::Replace($content, 
            '<link [^>]*rel="(?:shortcut )?icon"[^>]*>', 
            '<link href="favicon.png" rel="shortcut icon" type="image/x-icon"/>')
        $changesApplied = $true
    } else {
        # If no favicon link exists, add one after the title tag or before the closing head tag
        if ($content -match '</title>') {
            $content = $content -replace '</title>', '</title><link href="favicon.png" rel="shortcut icon" type="image/x-icon"/>'
            $changesApplied = $true
        } elseif ($content -match '</head>') {
            $content = $content -replace '</head>', '<link href="favicon.png" rel="shortcut icon" type="image/x-icon"/></head>'
            $changesApplied = $true
        }
    }
    
    # If changes were made, write the updated content back to the file
    if ($changesApplied) {
        Set-Content -Path $file.FullName -Value $content
        Write-Host "Updated favicon in $($file.Name)" -ForegroundColor Green
    } else {
        Write-Host "Could not update favicon in $($file.Name) - no suitable insertion point found" -ForegroundColor Red
    }
}

Write-Host "Favicon update completed!" -ForegroundColor Green
