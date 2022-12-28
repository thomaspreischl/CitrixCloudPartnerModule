function Get-PartnerCustomerCount {
    param(
      [parameter(Mandatory=$true)] $partnerID,
      $token
    )


    $baseUrl = "https://partner.citrixworkspacesapi.net"
    $Resource = "customers/count"

    $headers = @{
        Authorization = "$token"
        }

    $Uri = $baseUrl + "/"+ $partnerID + "/" + $Resource 


    $response = Invoke-RestMethod -Method GET -Uri $Uri -Headers $headers 
    $response = $response

    

    return $response

    }
    