function Get-PartnerCustomerConnection {
  <#
	    .SYNOPSIS
	    Get customer connections.
	    .DESCRIPTION
	    This function gives you customer connection in detailed form. ConnectionID, partnerID, customerID, adminname for customer/partner, Admin Mailaddress for customer/partner.
	    .PARAMETER partnerID
	    partnerID of your Citrix Cloud Tenant is mandatory to connect to the right Tenant.
      .PARAMETER customerID
	    customerID of your Citrix Cloud customer is mandatory to get information for the right tenant.
      .PARAMETER token
	    token should be the following content:'CwsAuth Bearer=ehJcciSRpICJ1bIsGIUkNnV5iJziyC6IIXO9....'
      Think its easier to put it in a variable. 
	    .EXAMPLE
	    Get-PartnerCustomerConnection -token 'CwsAuth Bearer=ehJcciSRpICJ1bIsGIUkNnV5iJziyC6IIXO9....' -partnerID '3asdf21' -customerID '3ngking1jtejtw'
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

    
    $response = $response.items |Select-Object connectionId, partnerId, customerId, type, `
                @{Name="CustomerAdminDisplayName"; Expression={ $_.customerInformation.displayName}}, @{Name="CustomerorgId"; Expression={ $_.customerInformation.orgId}},`
                @{Name="CustomeradminFullName"; Expression={ $_.customerInformation.adminFullName}},@{Name="CustomerAdminEmail"; Expression={ $_.customerInformation.adminEmail}},`
                @{Name="PartnerAdminDisplayName"; Expression={ $_.partnerInformation.displayName}}, @{Name="PartnerorgId"; Expression={ $_.partnerInformation.orgId}},`
                @{Name="PartnerAdminFullName"; Expression={ $_.partnerInformation.adminFullName}},@{Name="PartnerAdminEmail"; Expression={ $_.partnerInformation.adminEmail}},`
                services, federatedDomains



    return $response

    }