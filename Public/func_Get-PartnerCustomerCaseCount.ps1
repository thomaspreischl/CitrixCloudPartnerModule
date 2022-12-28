function Get-PartnerCustomerCaseCount {
    param(
      [parameter(Mandatory=$true)] $partnerID,
      [parameter(Mandatory=$true)] $customerID,
      $token
    )


    $baseUrl = "https://partner.citrixworkspacesapi.net"
    $Resource = "cases/counts"
    $Query = "?customers=" + $customerID

    $headers = @{
        Authorization = "$token"
        }

    $Uri = $baseUrl + "/"+ $partnerID + "/" + $Resource + $Query


    $response = Invoke-RestMethod -Method GET -Uri $Uri -Headers $headers 
    $response = $response.items
    
    return $response
    
}

