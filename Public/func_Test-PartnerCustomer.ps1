function Test-PartnerCustomer {
    param(
      [parameter(Mandatory=$true)] $customerID,
      $token
    )


    $baseUrl = "https://partner.citrixworkspacesapi.net"
    $Resource = "ping"

    $headers = @{
        Authorization = "$token"
        }

    $Uri = $baseUrl + "/"+ $customerID + "/" + $Resource


    $response = Invoke-RestMethod -Method GET -Uri $Uri -Headers $headers 
    
    return $response
    
}