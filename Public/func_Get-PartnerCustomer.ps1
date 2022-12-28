
function Get-PartnerCustomer {
    param(
      [parameter(Mandatory=$true)] $partnerID,
      $token,
      $customerID
    )


    $baseUrl = "https://partner.citrixworkspacesapi.net"
    $Resource = "customers"

    $headers = @{
        Authorization = "$token"
        }

    $Uri = $baseUrl + "/"+ $partnerID + "/" + $Resource


    $response = Invoke-RestMethod -Method GET -Uri $Uri -Headers $headers 
    #response = $response.items

    if (!$customerID) { 

    $response = $response.items | Select-Object notifictionCount ,@{Name="CustomerInformation"; Expression={ $_.customerInformation.displayName}}, @{Name="orgId"; Expression={ $_.customerInformation.orgId}},customerId, type, @{Name="adminFullName"; Expression={ $_.customerInformation.adminFullName}},@{Name="adminEmail"; Expression={ $_.customerInformation.adminEmail}}, services, federatedDomains, connectionId, serviceStates
    return $response
    
     }
     else {


    $response = $response.items |Where-Object {$_.customerId -eq $customerID} | Select-Object notifictionCount ,@{Name="CustomerInformation"; Expression={ $_.customerInformation.displayName}}, @{Name="orgId"; Expression={ $_.customerInformation.orgId}},customerId, type, @{Name="adminFullName"; Expression={ $_.customerInformation.adminFullName}},@{Name="adminEmail"; Expression={ $_.customerInformation.adminEmail}}, services, federatedDomains, connectionId, serviceStates
    return $response
    }

    }