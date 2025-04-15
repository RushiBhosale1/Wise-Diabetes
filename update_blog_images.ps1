$htmlFiles = Get-ChildItem -Path *.html

foreach ($file in $htmlFiles) {
    Write-Host "Processing $($file.Name)..."
    
    # Read the file content
    $content = Get-Content -Path $file.FullName -Raw
    
    # Check if the file contains the Latest Blogs section
    if ($content -match 'Latest Blogs') {
        # Flag to track if any changes were made
        $changesApplied = $false
        
        # Replace blog1 with blog1.jpeg
        if ($content -match 'blog1(?!\.jpeg)') {
            $content = $content -replace 'blog1(?!\.jpeg)', 'blog1.jpeg'
            $changesApplied = $true
        }
        
        # Replace blog2 with blog2.jpeg
        if ($content -match 'blog2(?!\.jpeg)') {
            $content = $content -replace 'blog2(?!\.jpeg)', 'blog2.jpeg'
            $changesApplied = $true
        }
        
        # If changes were made, write the updated content back to the file
        if ($changesApplied) {
            Set-Content -Path $file.FullName -Value $content
            Write-Host "Updated blog image references in $($file.Name)" -ForegroundColor Green
        } else {
            Write-Host "Blog image references already updated in $($file.Name)" -ForegroundColor Yellow
        }
    } else {
        Write-Host "No Latest Blogs section found in $($file.Name)" -ForegroundColor Yellow
    }
}

Write-Host "Blog image update completed!" -ForegroundColor Green
