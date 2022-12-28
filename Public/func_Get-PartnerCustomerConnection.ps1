function Get-PartnerCustomerConnection {
    param(
      [parameter(Mandatory=$true)] $partnerID,
      $token,
      [parameter(Mandatory=$true)]$customerID
    )


    $baseUrl = "https://partner.citrixworkspacesapi.net"
    $Resource = "customers"

    $headers = @{
        Authorization = "$token"
        }

    $Uri = $baseUrl + "/"+ $partnerID + "/" + $Resource + "/" + $customerID + "/connections"


    $response = Invoke-RestMethod -Method GET -Uri $Uri -Headers $headers 
    #$response = $response.items

    
    $response = $response.items |select connectionId, partnerId, customerId, type, `
                @{Name="CustomerAdminDisplayName"; Expression={ $_.customerInformation.displayName}}, @{Name="CustomerorgId"; Expression={ $_.customerInformation.orgId}},`
                @{Name="CustomeradminFullName"; Expression={ $_.customerInformation.adminFullName}},@{Name="CustomerAdminEmail"; Expression={ $_.customerInformation.adminEmail}},`
                @{Name="PartnerAdminDisplayName"; Expression={ $_.partnerInformation.displayName}}, @{Name="PartnerorgId"; Expression={ $_.partnerInformation.orgId}},`
                @{Name="PartnerAdminFullName"; Expression={ $_.partnerInformation.adminFullName}},@{Name="PartnerAdminEmail"; Expression={ $_.partnerInformation.adminEmail}},`
                services, federatedDomains



    return $response

    }