function New-PartnerCustomer {
    <#
	    .SYNOPSIS
	    Creates a new customer by partner and set up the connection between partner and customer.  
	    .DESCRIPTION
	    The function uses the Invoke-RestMethod command creates a new customer by partner and set up the connection between partner and customer.  
	    .PARAMETER partnerID
	    partnerID of your Citrix Cloud Tenant is mandatory to connect to the right Tenant.
        .PARAMETER $token
	    token should include your Auth Bearer Token. You can get it with function "Connect-CitrixAPI"
        .PARAMETER companyName
        companyName (string): The name of the company
        .PARAMETER firstName
        firstName (string): The first name of the user associated with the company
        .PARAMETER lastName
        lastName (string): The last name of the user associated with the company. ,
        .PARAMETER emailAddress
        emailAddress (string): The email address of the user associated with the company
        .PARAMETER address
	    address (string): The company's address (line 1)
        .PARAMETER addressCity
        addressCity (string): The company's city
        .PARAMETER addressState
        addressCountry (string): The company's country
        .PARAMETER addressCountry
        addressState (string, optional): The state the company is in, if applicable
        .PARAMETER addressZip
        addressZip (string, optional): The zip code for the company
        .PARAMETER phoneNumber
        phoneNumber (string, optional): Phone number, if applicable, of the customer
        .PARAMETER countryCode
        countryCode (string, optional): The country code.
        .PARAMETER areaCode 
        areaCode (string, optional): The area code.
        .PARAMETER identityProvider
        identityProvider (string): The type of Identity Provider to use when onboarding the customer. 
	    .EXAMPLE
	    New-PartnerCustomer -token 'CwsAuth Bearer=eyJhbGc23344ksfdjydfdssInR5cCI6IkpXVCJ9.....' -partnerID '123adsf123' -address 'Meisterstrasse 1123' -addressCity 'Amberg' -addressCountry 'Germany' -addressState 'Bavaria' -addressZip '84563' -companyName 'Meister32 GmbH' -emailAddress 'meister3@mmail.com' -firstName 'Harald' -lastName 'Muellnerer' -phoneNumber '2363356' -countryCode '05465' -areaCode '0049'
	    .INPUTS
	    System.String
	    .OUTPUTS
	    System.String
	    .NOTES
	    xxx
	    .LINK
	    https://www.thomaspreischl.de
	#>
    
    param(
      [parameter(Mandatory=$true)] $partnerID,
      [parameter(Mandatory=$true)] $token,
      [parameter(Mandatory=$true)] $address,
      [parameter(Mandatory=$true)] $addressCity,
      [parameter(Mandatory=$true)] $addressCountry,
      [parameter(Mandatory=$true)] $addressState,
      [parameter(Mandatory=$true)] $addressZip,
      [parameter(Mandatory=$true)] $companyName,
      [parameter(Mandatory=$true)] $emailAddress,
      [parameter(Mandatory=$true)] $firstName,
      [parameter(Mandatory=$true)] $lastName,
      $phoneNumber,
      $countryCode,
      $areaCode,
      $identityProvider
    )


    $baseUrl = "https://partner.citrixworkspacesapi.net"
    $Resource = "customers"

    $headers = @{
        'Authorization' = "$token"
                }

    if (!$identityProvider) { 

        $identityProvider = 'Cas'
        Write-Host "Identity Provider for customer was set to 'Cas'(default)"
    }
    else {
        <# Action when all if and elseif conditions are false #>
    }

    $body = @{        
            "identityProvider"="$identityProvider"
            "stsAccount"= @{
              "address"= "$address";
              "addressCity"= "$addressCity";
              "addressCountry"= "$addressCountry";
              "addressState"= "$addressState";
              "addressZip"= "$addressZip";
              "companyName"= "$companyName";
              "emailAddress"= "$emailAddress";
              "firstName"= "$firstName";
              "lastName"= "$lastName";
              "phoneNumber"= "$phoneNumber";
              "countryCode"= "$countryCode";
              "areaCode"= "$areaCode"
            
          }
    }

    $Uri = $baseUrl + "/"+ $partnerID + "/" + $Resource 

    try{
    $response = Invoke-RestMethod -Method POST -ContentType 'application/json' -Uri $Uri -Headers $headers -Body $body -ea stop
    $response = $response

    }
    
    catch {
        Write-host $_ -ForegroundColor Red
    }

    return $response

    }  function New-PartnerCustomer {
    <#
	    .SYNOPSIS
	    Creates a new customer by partner and set up the connection between partner and customer.  
	    .DESCRIPTION
	    The function uses the Invoke-RestMethod command creates a new customer by partner and set up the connection between partner and customer.  
	    .PARAMETER partnerID
	    partnerID of your Citrix Cloud Tenant is mandatory to connect to the right Tenant.
        .PARAMETER $token
	    token should include your Auth Bearer Token. You can get it with function "Connect-CitrixAPI"
        .PARAMETER companyName
        companyName (string): The name of the company
        .PARAMETER firstName
        firstName (string): The first name of the user associated with the company
        .PARAMETER lastName
        lastName (string): The last name of the user associated with the company. ,
        .PARAMETER emailAddress
        emailAddress (string): The email address of the user associated with the company
        .PARAMETER address
	    address (string): The company's address (line 1)
        .PARAMETER addressCity
        addressCity (string): The company's city
        .PARAMETER addressState
        addressCountry (string): The company's country
        .PARAMETER addressCountry
        addressState (string, optional): The state the company is in, if applicable
        .PARAMETER addressZip
        addressZip (string, optional): The zip code for the company
        .PARAMETER phoneNumber
        phoneNumber (string, optional): Phone number, if applicable, of the customer
        .PARAMETER countryCode
        countryCode (string, optional): The country code.
        .PARAMETER areaCode 
        areaCode (string, optional): The area code.
        .PARAMETER identityProvider
        identityProvider (string): The type of Identity Provider to use when onboarding the customer. 
	    .EXAMPLE
	    New-PartnerCustomer -token 'CwsAuth Bearer=eyJhbGc23344ksfdjydfdssInR5cCI6IkpXVCJ9.....' -partnerID '123adsf123' -address 'Meisterstrasse 1123' -addressCity 'Amberg' -addressCountry 'Germany' -addressState 'Bavaria' -addressZip '84563' -companyName 'Meister32 GmbH' -emailAddress 'meister3@mmail.com' -firstName 'Harald' -lastName 'Muellnerer' -phoneNumber '2363356' -countryCode '05465' -areaCode '0049'
	    .INPUTS
	    System.String
	    .OUTPUTS
	    System.String
	    .NOTES
	    xxx
	    .LINK
	    https://www.thomaspreischl.de
	#>
    param(
        [parameter(Mandatory=$true)] $partnerID,
        [parameter(Mandatory=$true)] $token,
        [parameter(Mandatory=$true)] $address,
        [parameter(Mandatory=$true)] $addressCity,
        [parameter(Mandatory=$true)] $addressCountry,
        [parameter(Mandatory=$true)] $addressState,
        [parameter(Mandatory=$true)] $addressZip,
        [parameter(Mandatory=$true)] $companyName,
        [parameter(Mandatory=$true)] $emailAddress,
        [parameter(Mandatory=$true)] $firstName,
        [parameter(Mandatory=$true)] $lastName,
        [parameter(Mandatory=$true)] $phoneNumber,
        [parameter(Mandatory=$true)] $countryCode,
        [parameter(Mandatory=$true)] $areaCode,
        $identityProvider
      )
  
  
      $baseUrl = "https://partner.citrixworkspacesapi.net"
      $Resource = "customers"
  
      $headers = @{
          'Authorization' = "$token"
          
                  }
  
      if (!$identityProvider) { 
  
          $identityProvider = 'Cas'
          Write-Host "Identity Provider for customer was set to 'Cas'(default)"
      }
      else {
          <# Action when all if and elseif conditions are false #>
      }
      
      $body = @{        
              "identityProvider"="$identityProvider";
              "stsAccount"= @{
                "address"= "$address";
                "addressCity"= "$addressCity";
                "addressCountry"= "$addressCountry";
                "addressState"= "$addressState";
                "addressZip"= "$addressZip";
                "companyName"= "$companyName";
                "emailAddress"= "$emailAddress";
                "firstName"= "$firstName";
                "lastName"= "$lastName";
                "phoneNumber"= "$phoneNumber";
                "countryCode"= "$countryCode";
                "areaCode"= "$areaCode"
              
            }
      } | ConvertTo-Json
  
  
      $Uri = $baseUrl + "/"+ $partnerID + "/" + $Resource 
  
      write-host $Uri
  
      try{
      $response = Invoke-RestMethod -Method POST -ContentType 'application/json' -Uri $Uri -Headers $headers -Body $body -ea stop
      
      write-host 'Customer was successfully created!'`r`n -ForegroundColor Green
  
      }
      
      catch {
          write-host 'Not able to create the new account:'`r`n -ForegroundColor Yellow
  
          Write-host $_ -ForegroundColor Red
  
      }
  
      return $response
  
      Write-Host "$response"
  
      }