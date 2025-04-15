function Update-SEO {
    param (
        [string]$filePath,
        [string]$title,
        [string]$description,
        [string]$keywords
    )
    
    $content = Get-Content -Path $filePath -Raw
    
    # Update title tag
    if ($content -match '<title>.*?</title>') {
        $content = $content -replace '<title>.*?</title>', "<title>$title</title>"
    }
    
    # Update meta description
    if ($content -match '<meta name="description" content=".*?">') {
        $content = $content -replace '<meta name="description" content=".*?">', "<meta name=`"description`" content=`"$description`">"
    } elseif ($content -match '<meta content=".*?" property="og:description"/>') {
        $content = $content -replace '<meta content=".*?" property="og:description"/>', "<meta content=`"$description`" property=`"og:description`"/>"
    } else {
        # If no meta description exists, add one after the title
        $content = $content -replace '(<title>.*?</title>)', "`$1`n    <meta name=`"description`" content=`"$description`">"
    }
    
    # Update meta keywords
    if ($content -match '<meta name="keywords" content=".*?">') {
        $content = $content -replace '<meta name="keywords" content=".*?">', "<meta name=`"keywords`" content=`"$keywords`">"
    } else {
        # If no meta keywords exist, add them after the description
        $content = $content -replace '(<meta name="description" content=".*?">)', "`$1`n    <meta name=`"keywords`" content=`"$keywords`">"
    }
    
    # Write the updated content back to the file
    Set-Content -Path $filePath -Value $content
    
    Write-Host "Updated SEO for $filePath" -ForegroundColor Green
}

# Get all HTML files
$htmlFiles = Get-ChildItem -Path *.html

foreach ($file in $htmlFiles) {
    $fileName = $file.Name
    $baseName = $file.BaseName -replace "-", " "
    
    # Default SEO values
    $title = "$baseName | Dr. Rao Diabetes Center"
    $description = "Learn about $baseName at Dr. Rao Diabetes Center. Expert diabetes care and management services for better health outcomes."
    $keywords = "diabetes, $baseName, Dr. Rao Diabetes Center, diabetes management, diabetes care"
    
    # Customize SEO based on specific pages
    switch -Wildcard ($fileName) {
        "index.html" {
            $title = "Dr. Rao Diabetes Center | Expert Diabetes Care & Management"
            $description = "Dr. Rao Diabetes Center offers comprehensive diabetes care, management, and education services. Our expert team provides personalized treatment plans for all types of diabetes."
            $keywords = "diabetes center, diabetes care, diabetes management, Dr. Rao, diabetes specialist, diabetes treatment"
        }
        
        "about.html" {
            $title = "About Us | Dr. Rao Diabetes Center"
            $description = "Learn about Dr. Rao Diabetes Center's mission, vision, and commitment to providing exceptional diabetes care and management services."
            $keywords = "about Dr. Rao Diabetes Center, diabetes care center, diabetes management facility, diabetes specialists"
        }
        
        "contact.html" {
            $title = "Contact Us | Dr. Rao Diabetes Center"
            $description = "Contact Dr. Rao Diabetes Center for appointments, inquiries, or information about our diabetes care and management services."
            $keywords = "contact Dr. Rao Diabetes Center, diabetes center contact, diabetes care appointments, diabetes management consultation"
        }
        
        "*Type 1 Diabetes*" {
            $title = "Type 1 Diabetes Management | Dr. Rao Diabetes Center"
            $description = "Comprehensive Type 1 diabetes management services at Dr. Rao Diabetes Center. Expert care, education, and support for effective blood sugar control."
            $keywords = "Type 1 diabetes, juvenile diabetes, insulin-dependent diabetes, diabetes management, blood sugar control, Dr. Rao Diabetes Center"
        }
        
        "*Type 2 Diabetes*" {
            $title = "Type 2 Diabetes Management | Dr. Rao Diabetes Center"
            $description = "Expert Type 2 diabetes management at Dr. Rao Diabetes Center. Personalized treatment plans, lifestyle guidance, and ongoing support for better health outcomes."
            $keywords = "Type 2 diabetes, adult-onset diabetes, diabetes management, blood sugar control, lifestyle modifications, Dr. Rao Diabetes Center"
        }
        
        "*Pregnancy Diabetes*" {
            $title = "Gestational Diabetes Management | Dr. Rao Diabetes Center"
            $description = "Specialized care for gestational diabetes at Dr. Rao Diabetes Center. Protecting mother and baby with expert monitoring and management during pregnancy."
            $keywords = "gestational diabetes, pregnancy diabetes, diabetes during pregnancy, maternal health, Dr. Rao Diabetes Center"
        }
        
        "*Consultation*" {
            $title = "Diabetes Consultation Services | Dr. Rao Diabetes Center"
            $description = "Expert diabetes consultation services at Dr. Rao Diabetes Center. Comprehensive evaluation, personalized treatment plans, and ongoing management for all types of diabetes."
            $keywords = "diabetes consultation, diabetes doctor, diabetes specialist, diabetes evaluation, Dr. Rao Diabetes Center"
        }
        
        "*Blood Testing*" {
            $title = "Diabetes Blood Testing Services | Dr. Rao Diabetes Center"
            $description = "State-of-the-art blood testing services for diabetes management at Dr. Rao Diabetes Center. Accurate, timely results for effective diabetes care."
            $keywords = "diabetes blood tests, HbA1c testing, glucose monitoring, blood sugar testing, diabetes laboratory, Dr. Rao Diabetes Center"
        }
        
        "*Diet Consultation*" {
            $title = "Diabetes Diet Consultation | Dr. Rao Diabetes Center"
            $description = "Expert nutritional counseling for diabetes management at Dr. Rao Diabetes Center. Personalized meal plans and dietary guidance for better blood sugar control."
            $keywords = "diabetes diet, nutrition counseling, diabetic meal plans, diabetes management, Dr. Rao Diabetes Center"
        }
        
        "*Health Food*" {
            $title = "Diabetic-Friendly Health Food Shop | Dr. Rao Diabetes Center"
            $description = "Specialized health food shop at Dr. Rao Diabetes Center offering diabetic-friendly foods, supplements, and dietary products to support your diabetes management plan."
            $keywords = "diabetic food, health food shop, diabetes supplements, sugar-free products, low-glycemic foods, Dr. Rao Diabetes Center"
        }
        
        "*Vaccine*" {
            $title = "Vaccination Services for Diabetics | Dr. Rao Diabetes Center"
            $description = "Comprehensive vaccination services for people with diabetes at Dr. Rao Diabetes Center. Protect yourself against preventable diseases with our specialized immunization services."
            $keywords = "diabetes vaccinations, flu shots for diabetics, pneumonia vaccine, diabetes immunization, Dr. Rao Diabetes Center"
        }
        
        "*Facilities*" {
            $title = "Comprehensive Diabetes Care Facilities | Dr. Rao Diabetes Center"
            $description = "All diabetes care facilities under one roof at Dr. Rao Diabetes Center. Access medical consultations, diagnostics, pharmacy, and specialized services in a single location."
            $keywords = "diabetes care facilities, one-stop diabetes center, comprehensive diabetes management, integrated diabetes services, Dr. Rao Diabetes Center"
        }
        
        "*Monitoring*" {
            $title = "Diabetes Monitoring Services | Dr. Rao Diabetes Center"
            $description = "Advanced diabetes monitoring services at Dr. Rao Diabetes Center. Continuous glucose monitoring, regular check-ups, and comprehensive tracking for optimal diabetes management."
            $keywords = "diabetes monitoring, glucose monitoring, blood sugar tracking, diabetes management, Dr. Rao Diabetes Center"
        }
        
        "*Education*" {
            $title = "Diabetes Education Programs | Dr. Rao Diabetes Center"
            $description = "Comprehensive diabetes education programs at Dr. Rao Diabetes Center. Learn essential self-management skills, nutrition guidance, and lifestyle modifications for better diabetes control."
            $keywords = "diabetes education, diabetes self-management, diabetes classes, diabetes learning, Dr. Rao Diabetes Center"
        }
        
        "*Lifestyle*" {
            $title = "Diabetes & Lifestyle Management | Dr. Rao Diabetes Center"
            $description = "Expert guidance on lifestyle management for diabetes at Dr. Rao Diabetes Center. Learn how diet, exercise, stress management, and sleep affect your diabetes control."
            $keywords = "diabetes lifestyle, diabetes management, healthy living with diabetes, diabetes exercise, diabetes diet, Dr. Rao Diabetes Center"
        }
        
        default {
            # Keep the default values set above
        }
    }
    
    # Update the SEO for the file
    Update-SEO -filePath $file.FullName -title $title -description $description -keywords $keywords
}

Write-Host "SEO implementation completed!" -ForegroundColor Green
