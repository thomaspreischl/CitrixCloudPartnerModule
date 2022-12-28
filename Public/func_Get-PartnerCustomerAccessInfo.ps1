function Get-PartnerCustomerAccessInfo {
    param(
      [parameter(Mandatory=$true)] $partnerID,
      [parameter(Mandatory=$true)] $customerID,
      $token
    )


    $baseUrl = "https://partner.citrixworkspacesapi.net"
    $Resource = "customers/accesstypes"
    $Query = "?customers=" + $customerID

    $headers = @{
        Authorization = "$token"
        }

    $Uri = $baseUrl + "/"+ $partnerID + "/" + $Resource + $Query


    $response = Invoke-RestMethod -Method GET -Uri $Uri -Headers $headers 
    $response = $response.items

    $customername = Get-PartnerCustomerInfo -token $token -partnerID $partnerID -customerID $customerID | select displayName
    $customername = $customername.displayName

    Write-Verbose "Access Information for customer: $customername" -Verbose

    
    return $response
    
}