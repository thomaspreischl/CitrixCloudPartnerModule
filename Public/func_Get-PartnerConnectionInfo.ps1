function Get-PartnerConnectionInfo {
    param(
      [parameter(Mandatory=$true)] $partnerID,
      $token,
      [parameter(Mandatory=$true)]$customerID
    )


    $baseUrl = "https://partner.citrixworkspacesapi.net"
    $Resource = "connections"
    $Query = "?id=" + $customerID + "&role=Partner&type=All"

    $headers = @{
        Authorization = "$token"
        }

    $Uri = $baseUrl + "/"+ $partnerID + "/" + $Resource + $Query


    $response = Invoke-RestMethod -Method GET -Uri $Uri -Headers $headers 
    #$response = $response.items

    
    $response = $response | select connectionId, partnerId, customerId, type, `
                @{Name="CustomerAdminDisplayName"; Expression={ $_.customerInformation.displayName}}, @{Name="CustomerorgId"; Expression={ $_.customerInformation.orgId}},`
                @{Name="CustomeradminFullName"; Expression={ $_.customerInformation.adminFullName}},@{Name="CustomerAdminEmail"; Expression={ $_.customerInformation.adminEmail}},`
                services, federatedDomains



    return $response

    }