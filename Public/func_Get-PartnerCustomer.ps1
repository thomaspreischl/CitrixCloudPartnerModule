
function Get-PartnerCustomer {
    <#
	    .SYNOPSIS
	    List existing Citrix Cloud customers
	    .DESCRIPTION
	    This function lists all customers linked to the partner account. Notifications, OrgID, services and much more information can be retrieved here.
	    .PARAMETER partnerID
	    partnerID of your Citrix Cloud Tenant is mandatory to connect to the right Tenant.
      .PARAMETER token
	    token should be the following content:'CwsAuth Bearer=ehJcciSRpICJ1bIsGIUkNnV5iJziyC6IIXO9....'
      Think its easier to put it in a variable. 
	    .EXAMPLE
	    Get-PartnerCustomer -token 'CwsAuth Bearer=ehJcciSRpICJ1bIsGIUkNnV5iJziyC6IIXO9....' -partnerID '3asdf21' 
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