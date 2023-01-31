function Get-PartnerCustomerAccessInfo {
  <#
	    .SYNOPSIS
	    Get access type from current admin to targeted customers.
	    .DESCRIPTION
	    This function gives you information, which access type the user which is used for the API key have to the customer tenant.
	    .PARAMETER partnerID
	    partnerID of your Citrix Cloud Tenant is mandatory to connect to the right Tenant.
      .PARAMETER customerID
	    customerID of your Citrix Cloud customer is mandatory to get information for the right tenant.
      .PARAMETER token
	    token should be the following content:'CwsAuth Bearer=ehJcciSRpICJ1bIsGIUkNnV5iJziyC6IIXO9....'
      Think its easier to put it in a variable. 
	    .EXAMPLE
	    Get-PartnerCustomerAccessInfo -token 'CwsAuth Bearer=ehJcciSRpICJ1bIsGIUkNnV5iJziyC6IIXO9....' -partnerID '3asdf21' -customerID '3ngking1jtejtw'
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