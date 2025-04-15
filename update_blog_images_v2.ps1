$htmlFiles = Get-ChildItem -Path *.html

foreach ($file in $htmlFiles) {
    Write-Host "Processing $($file.Name)..."
    
    # Read the file content
    $content = Get-Content -Path $file.FullName -Raw
    
    # Flag to track if any changes were made
    $changesApplied = $false
    
    # Replace blog1 with blog1.jpeg (when not already .jpeg)
    if ($content -match '(src="|background-image:url\()blog1(?!\.jpeg)') {
        $content = $content -replace '(src="|background-image:url\()blog1(?!\.jpeg)', '$1blog1.jpeg'
        $changesApplied = $true
    }
    
    # Replace blog2 with blog2.jpeg (when not already .jpeg)
    if ($content -match '(src="|background-image:url\()blog2(?!\.jpeg)') {
        $content = $content -replace '(src="|background-image:url\()blog2(?!\.jpeg)', '$1blog2.jpeg'
        $changesApplied = $true
    }
    
    # If changes were made, write the updated content back to the file
    if ($changesApplied) {
        Set-Content -Path $file.FullName -Value $content
        Write-Host "Updated blog image references in $($file.Name)" -ForegroundColor Green
    } else {
        Write-Host "No blog image references to update in $($file.Name)" -ForegroundColor Yellow
    }
}

Write-Host "Blog image update completed!" -ForegroundColor Green
