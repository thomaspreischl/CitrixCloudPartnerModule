
function Get-PartnerCustomerInfo {
    param(
      [parameter(Mandatory=$true)] $partnerID,
      [parameter(Mandatory=$true)] $customerID,
      $token
    )


    $baseUrl = "https://partner.citrixworkspacesapi.net"
    $Resource = "customers"

    $headers = @{
        Authorization = "$token"
        }

    $Uri = $baseUrl + "/"+ $partnerID + "/" + $Resource + "/" + $customerID + "/information"


    $response = Invoke-RestMethod -Method GET -Uri $Uri -Headers $headers 
    $response = $response
    
    return $response
    
}