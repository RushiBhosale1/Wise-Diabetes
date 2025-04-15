$structuredDataTemplate = @'
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "MedicalBusiness",
  "name": "Dr. Rao Diabetes Center",
  "url": "https://drraodiabeticcenter.com",
  "logo": "https://drraodiabeticcenter.com/logo.png",
  "image": "https://drraodiabeticcenter.com/logo.png",
  "description": "Dr. Rao Diabetes Center offers comprehensive diabetes care, management, and education services. Our expert team provides personalized treatment plans for all types of diabetes.",
  "telephone": "+918530111065",
  "email": "drchadra.wise@gmail.com",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "Dr. Rao Diabetes Center",
    "addressLocality": "Pune",
    "addressRegion": "Maharashtra",
    "postalCode": "411001",
    "addressCountry": "IN"
  },
  "geo": {
    "@type": "GeoCoordinates",
    "latitude": "18.5204",
    "longitude": "73.8567"
  },
  "openingHoursSpecification": [
    {
      "@type": "OpeningHoursSpecification",
      "dayOfWeek": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
      "opens": "09:00",
      "closes": "18:00"
    }
  ],
  "sameAs": [
    "https://www.linkedin.com/company/dr-rao-diabetes-center",
    "https://www.facebook.com/drraodiabeticcenter",
    "https://www.instagram.com/drraodiabeticcenter"
  ],
  "medicalSpecialty": ["Diabetology", "Endocrinology"],
  "availableService": [
    {
      "@type": "MedicalProcedure",
      "name": "Diabetes Consultation",
      "description": "Expert consultation for all types of diabetes"
    },
    {
      "@type": "MedicalProcedure",
      "name": "Advanced Diagnostics",
      "description": "Comprehensive testing for diabetes management"
    },
    {
      "@type": "MedicalProcedure",
      "name": "Diabetes Education",
      "description": "Educational programs for diabetes self-management"
    }
  ]
}
</script>
'@

function Get-PageSpecificSEO {
    param (
        [string]$fileName,
        [string]$pageTitle
    )
    
    $baseName = $fileName -replace "\.html$", ""
    $baseName = $baseName -replace "-", " "
    $baseName = $baseName -replace "_", " "
    
    # Default values
    $title = "$pageTitle | Dr. Rao Diabetes Center"
    $description = "Learn about $pageTitle at Dr. Rao Diabetes Center. Expert diabetes care and management services for better health outcomes."
    $keywords = "diabetes, $pageTitle, Dr. Rao Diabetes Center, diabetes management, diabetes care"
    
    # Customize based on specific pages
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
    
    return @{
        Title = $title
        Description = $description
        Keywords = $keywords
    }
}

function Update-SEOTags {
    param (
        [string]$content,
        [string]$title,
        [string]$description,
        [string]$keywords
    )
    
    # Update title tag
    if ($content -match '<title>.*?</title>') {
        $content = $content -replace '<title>.*?</title>', "<title>$title</title>"
    } else {
        $content = $content -replace '<head>', "<head>`n<title>$title</title>"
    }
    
    # Update meta description
    if ($content -match '<meta name="description" content=".*?">') {
        $content = $content -replace '<meta name="description" content=".*?">', "<meta name=`"description`" content=`"$description`">"
    } elseif ($content -match '<meta content=".*?" property="og:description"/>') {
        $content = $content -replace '<meta content=".*?" property="og:description"/>', "<meta content=`"$description`" property=`"og:description`"/>"
    } else {
        $content = $content -replace '</title>', "</title>`n<meta name=`"description`" content=`"$description`">"
    }
    
    # Update meta keywords
    if ($content -match '<meta name="keywords" content=".*?">') {
        $content = $content -replace '<meta name="keywords" content=".*?">', "<meta name=`"keywords`" content=`"$keywords`">"
    } else {
        $content = $content -replace '<meta name="description" content=".*?">', "<meta name=`"description`" content=`"$description`">`n<meta name=`"keywords`" content=`"$keywords`">"
    }
    
    # Update Open Graph and Twitter tags
    if (-not ($content -match '<meta property="og:title"') -and -not ($content -match '<meta content=".*?" property="og:title"')) {
        $ogTags = @"
<meta content="$title" property="og:title"/>
<meta content="$title" property="twitter:title"/>
<meta property="og:description" content="$description"/>
<meta property="twitter:description" content="$description"/>
<meta property="og:type" content="website"/>
<meta property="og:url" content="https://drraodiabeticcenter.com/"/>
<meta property="og:image" content="logo.png"/>
<meta property="twitter:card" content="summary_large_image"/>
<meta property="twitter:image" content="logo.png"/>
"@
        $content = $content -replace '<meta name="keywords" content=".*?">', "<meta name=`"keywords`" content=`"$keywords`">`n$ogTags"
    } else {
        # Update existing OG tags
        if ($content -match '<meta content=".*?" property="og:title"/>') {
            $content = $content -replace '<meta content=".*?" property="og:title"/>', "<meta content=`"$title`" property=`"og:title`"/>"
        }
        if ($content -match '<meta content=".*?" property="twitter:title"/>') {
            $content = $content -replace '<meta content=".*?" property="twitter:title"/>', "<meta content=`"$title`" property=`"twitter:title`"/>"
        }
        if ($content -match '<meta property="og:description" content=".*?"/>') {
            $content = $content -replace '<meta property="og:description" content=".*?"/>', "<meta property=`"og:description`" content=`"$description`"/>"
        }
        if ($content -match '<meta property="twitter:description" content=".*?"/>') {
            $content = $content -replace '<meta property="twitter:description" content=".*?"/>', "<meta property=`"twitter:description`" content=`"$description`"/>"
        }
    }
    
    return $content
}

function Add-StructuredData {
    param (
        [string]$content,
        [string]$structuredData
    )
    
    # Check if structured data already exists
    if ($content -match '<script type="application/ld\+json">') {
        # Replace existing structured data
        $pattern = '<script type="application/ld\+json">[\s\S]*?</script>'
        $content = $content -replace $pattern, $structuredData
    } else {
        # Add structured data before </head>
        $content = $content -replace '</head>', "$structuredData`n</head>"
    }
    
    return $content
}

# Get all HTML files
$htmlFiles = Get-ChildItem -Path *.html

foreach ($file in $htmlFiles) {
    Write-Host "Processing $($file.Name)..." -ForegroundColor Cyan
    
    # Read the file content
    $content = Get-Content -Path $file.FullName -Raw
    
    # Extract current title if it exists
    $currentTitle = ""
    if ($content -match '<title>(.*?)</title>') {
        $currentTitle = $matches[1]
    } else {
        $currentTitle = $file.BaseName -replace "-", " " -replace "_", " "
    }
    
    # Get page-specific SEO data
    $seoData = Get-PageSpecificSEO -fileName $file.Name -pageTitle $currentTitle
    
    # Update SEO tags
    $updatedContent = Update-SEOTags -content $content -title $seoData.Title -description $seoData.Description -keywords $seoData.Keywords
    
    # Add structured data
    $finalContent = Add-StructuredData -content $updatedContent -structuredData $structuredDataTemplate
    
    # Write the updated content back to the file
    Set-Content -Path $file.FullName -Value $finalContent
    
    Write-Host "Updated SEO for $($file.Name)" -ForegroundColor Green
}

Write-Host "SEO update completed for all HTML files!" -ForegroundColor Green
