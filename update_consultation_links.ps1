$htmlFiles = Get-ChildItem -Path *.html

foreach ($file in $htmlFiles) {
    Write-Host "Processing $($file.Name)..."
    
    # Read the file content
    $content = Get-Content -Path $file.FullName -Raw
    
    # Check if the file contains the link that needs to be updated
    if ($content -match '<a href="/book-consultation-a" class="button fullwidth w-inline-block">') {
        # Update the link
        $updatedContent = $content -replace '<a href="/book-consultation-a" class="button fullwidth w-inline-block">', '<a href="contact.html" class="button fullwidth w-inline-block">'
        
        # Write the updated content back to the file
        Set-Content -Path $file.FullName -Value $updatedContent
        
        Write-Host "Updated consultation link in $($file.Name)" -ForegroundColor Green
    } else {
        Write-Host "No consultation link found in $($file.Name) or already updated" -ForegroundColor Yellow
    }
}

Write-Host "Consultation link update completed!" -ForegroundColor Green
