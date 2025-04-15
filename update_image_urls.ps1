$htmlFiles = Get-ChildItem -Path *.html

foreach ($file in $htmlFiles) {
    Write-Host "Processing $($file.Name)..."
    
    # Read the file content
    $content = Get-Content -Path $file.FullName -Raw
    
    # Check if the file contains the malformed URL pattern
    if ($content -match '&quot;https://&quot;https//cdn\.prod\.website-files\.com/[^&]*&quot;&quot;') {
        # Update all instances of the malformed URL pattern to blog1.jpeg
        $updatedContent = $content -replace '&quot;https://&quot;https//cdn\.prod\.website-files\.com/[^&]*&quot;&quot;', 'blog1.jpeg'
        
        # Write the updated content back to the file
        Set-Content -Path $file.FullName -Value $updatedContent
        
        Write-Host "Updated image URLs in $($file.Name)" -ForegroundColor Green
    } else {
        Write-Host "No malformed image URLs found in $($file.Name)" -ForegroundColor Yellow
    }
}

Write-Host "Image URL update completed!" -ForegroundColor Green
