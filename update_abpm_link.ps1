$htmlFiles = Get-ChildItem -Path *.html

foreach ($file in $htmlFiles) {
    Write-Host "Processing $($file.Name)..."
    
    # Read the file content
    $content = Get-Content -Path $file.FullName -Raw
    
    # Check if the file contains the link that needs to be updated
    if ($content -match '<a href="Special Programs/Ambulatory BP Monitoring.html" class="link-small---no-underline">Ambulatory BP Monitoring \(ABPM\)</a>') {
        # Update the link
        $updatedContent = $content -replace '<a href="Special Programs/Ambulatory BP Monitoring.html" class="link-small---no-underline">Ambulatory BP Monitoring \(ABPM\)</a>', '<a href="Ambulatory BP Monitoring.html" class="link-small---no-underline">Ambulatory BP Monitoring (ABPM)</a>'
        
        # Write the updated content back to the file
        Set-Content -Path $file.FullName -Value $updatedContent
        
        Write-Host "Updated ABPM link in $($file.Name)" -ForegroundColor Green
    } else {
        Write-Host "No ABPM link found in $($file.Name) or already updated" -ForegroundColor Yellow
    }
}

Write-Host "ABPM link update completed!" -ForegroundColor Green
