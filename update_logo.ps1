$htmlFiles = Get-ChildItem -Path *.html

foreach ($file in $htmlFiles) {
    Write-Host "Processing $($file.Name)..."
    
    # Read the file content
    $content = Get-Content -Path $file.FullName -Raw
    
    # Check if the file contains a logo image in the navigation section
    if ($content -match '<a href="/" .*?class="logo-box w-nav-brand.*?"><img src=".*?" loading="lazy"') {
        # Update the logo image with size constraints and ensure src is logo.png
        $updatedContent = $content -replace '<a href="/" (.*?)class="logo-box w-nav-brand(.*?)"><img src="(.*?)" loading="lazy" alt="(.*?)"(.*?)/>',
                                           '<a href="/" $1class="logo-box w-nav-brand$2"><img src="logo.png" loading="lazy" alt="$4" style="max-width: 150px; height: auto;"$5/>'
        
        # Write the updated content back to the file
        Set-Content -Path $file.FullName -Value $updatedContent
        
        Write-Host "Updated logo in $($file.Name)" -ForegroundColor Green
    } else {
        Write-Host "No logo found in navigation section of $($file.Name)" -ForegroundColor Yellow
    }
}

Write-Host "Logo update completed!" -ForegroundColor Green
