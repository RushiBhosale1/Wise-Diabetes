$htmlFiles = Get-ChildItem -Path *.html

foreach ($file in $htmlFiles) {
    Write-Host "Processing $($file.Name)..."
    
    # Read the file content
    $content = Get-Content -Path $file.FullName -Raw
    
    # Create a more specific pattern to match the malformed URLs
    $pattern = '&quot;https://&quot;https//cdn\.prod\.website-files\.com/671ea29a420cf850291982a1/[^&"]*&quot;&quot;'
    
    # Check if the file contains the malformed URL pattern
    if ($content -match $pattern) {
        # Update all instances of the malformed URL pattern to blog1.jpeg
        $updatedContent = [regex]::Replace($content, $pattern, '"blog1.jpeg"')
        
        # Write the updated content back to the file
        Set-Content -Path $file.FullName -Value $updatedContent
        
        Write-Host "Updated image URLs in $($file.Name)" -ForegroundColor Green
    } else {
        Write-Host "No malformed image URLs found in $($file.Name)" -ForegroundColor Yellow
    }
}

Write-Host "Image URL update completed!" -ForegroundColor Green
