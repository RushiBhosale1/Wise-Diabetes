$scriptToAdd = @"

<script>
  document.addEventListener('DOMContentLoaded', function () {
    const toggles = document.querySelectorAll('.nav-toggle .inner-nav-toggle-box');

    toggles.forEach(toggle => {
      toggle.addEventListener('click', function (e) {
        e.preventDefault();

        // Close all open dropdowns
        document.querySelectorAll('.nav-toggle .inner-toggle-options-box').forEach(box => {
          if (!box.contains(this.nextElementSibling)) {
            box.style.display = 'none';
          }
        });

        // Toggle the clicked dropdown
        const dropdown = this.nextElementSibling;
        if (dropdown.style.display === 'block') {
          dropdown.style.display = 'none';
        } else {
          dropdown.style.display = 'block';
        }
      });
    });

    // Optional: Click outside to close all
    document.addEventListener('click', function (e) {
      if (!e.target.closest('.nav-toggle')) {
        document.querySelectorAll('.inner-toggle-options-box').forEach(box => {
          box.style.display = 'none';
        });
      }
    });
  });
</script>
"@

$htmlFiles = Get-ChildItem -Path *.html

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw
    
    # Check if the script is already present
    if ($content -match "document\.addEventListener\('DOMContentLoaded', function \(\) \{\s*const toggles = document\.querySelectorAll\('\.nav-toggle \.inner-nav-toggle-box'\);") {
        Write-Host "Script already exists in $($file.Name). Skipping..."
        continue
    }
    
    # Replace the closing body tag with the script followed by the closing body tag
    $newContent = $content -replace "</body></html>", "$scriptToAdd`n</body></html>"
    
    # Write the modified content back to the file
    Set-Content -Path $file.FullName -Value $newContent
    
    Write-Host "Added script to $($file.Name)"
}

Write-Host "Script addition completed!"
