function Get-PartnerConnectionInfo {
  <#
	    .SYNOPSIS
	    Get information about partner - customer link
	    .DESCRIPTION
	    With this function the partner - customer link for a specific customer can be displayed. In addition, the OrgID can be retrieved directly.
	    .PARAMETER partnerID
	    partnerID of your Citrix Cloud tenant is mandatory to connect to the right tenant.
      .PARAMETER customerID
	    customerID of your Citrix Cloud customer is mandatory to get information for the right tenant.
      .PARAMETER token
	    token should be the following content:'CwsAuth Bearer=ehJcciSRpICJ1bIsGIUkNnV5iJziyC6IIXO9....'
      Think its easier to put it in a variable. 
	    .EXAMPLE
	    Get-PartnerConnectionInfo -token 'CwsAuth Bearer=ehJcciSRpICJ1bIsGIUkNnV5iJziyC6IIXO9....' -partnerID '3asdf21' -customerID '3ngking1jtejtw'
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
    $Resource = "connections"
    $Query = "?id=" + $customerID + "&role=Partner&type=All"

    $headers = @{
        Authorization = "$token"
        }

    $Uri = $baseUrl + "/"+ $partnerID + "/" + $Resource + $Query


    $response = Invoke-RestMethod -Method GET -Uri $Uri -Headers $headers 
    #$response = $response.items

    
    $response = $response | Select-Object connectionId, partnerId, customerId, type, `
                @{Name="CustomerAdminDisplayName"; Expression={ $_.customerInformation.displayName}}, @{Name="CustomerorgId"; Expression={ $_.customerInformation.orgId}},`
                @{Name="CustomeradminFullName"; Expression={ $_.customerInformation.adminFullName}},@{Name="CustomerAdminEmail"; Expression={ $_.customerInformation.adminEmail}},`
                services, federatedDomains



    return $response

    }