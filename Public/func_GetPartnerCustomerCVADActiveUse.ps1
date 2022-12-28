function Get-PartnerCustomerCVADActiveUse {
    param(
      [parameter(Mandatory=$true)] $partnerID,
      [parameter(Mandatory=$true)] $customerID,
      $token
    )


    $baseUrl = "https://partner.citrixworkspacesapi.net"
    $Resource = "activeuse/partner/tenant/cloud/cvad/current"
    $Query = "?customer=" + $customerID

    $headers = @{
        Authorization = "$token"
        }

    $Uri = $baseUrl + "/"+ $partnerID + "/" + $Resource + $Query

    
    $customername = Get-PartnerCustomerInfo -token $token -partnerID $partnerID -customerID $customerID | select displayName
    $customername = $customername.displayName

    Write-Host "License Active Use Information for customer: $customername" -ForegroundColor Yellow


    $response = Invoke-RestMethod -Method GET -Uri $Uri -Headers $headers | select ccuActiveUse, udActiveUse

     if (!$ccuActiveUse) {
     $response = $response.udActiveUse
     Write-host 'Customer is licensed with User/Device Licenses.' -ForegroundColor Yellow
      
     }
     else {
     $response = $response.cuActiveUse
     Write-host 'Customer is licensed with Concurrent Licenses.' -ForegroundColor Yellow
     
     }
    


    
    return $response
    
}

