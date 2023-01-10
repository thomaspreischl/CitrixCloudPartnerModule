function Get-PartnerCustomerLogo {
  <#
	    .SYNOPSIS
	    Get connected customer's account logo url for partner.
	    .DESCRIPTION
	    If a customer account logo is currently set, you will get it back here.
	    .PARAMETER partnerID
	    partnerID of your Citrix Cloud Tenant is mandatory to connect to the right Tenant.
      .PARAMETER customerID
	    customerID of your Citrix Cloud customer is mandatory to get information for the right tenant.
      .PARAMETER token
	    token should be the following content:'CwsAuth Bearer=ehJcciSRpICJ1bIsGIUkNnV5iJziyC6IIXO9....'
      Think its easier to put it in a variable. 
	    .EXAMPLE
	    Get-PartnerCustomerLogo -token 'CwsAuth Bearer=ehJcciSRpICJ1bIsGIUkNnV5iJziyC6IIXO9....' -partnerID '3asdf21' -customerID '3ngking1jtejtw'
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

    $Uri = $baseUrl + "/"+ $partnerID + "/" + $Resource + "/" + $customerID + "/logo"


    $response = Invoke-RestMethod -Method GET -Uri $Uri -Headers $headers 
    

    
    $response = $response.items 



    return $response

    }