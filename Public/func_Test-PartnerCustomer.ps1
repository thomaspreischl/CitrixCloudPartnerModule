function Test-PartnerCustomer {
  <#
	    .SYNOPSIS
	    Test whether the service is operational.
	    .DESCRIPTION
	    This function checks whether the service is operational.
      .PARAMETER customerID
	    customerID of your Citrix Cloud customer is mandatory to get information for the right tenant.
      .PARAMETER token
	    token should be the following content:'CwsAuth Bearer=ehJcciSRpICJ1bIsGIUkNnV5iJziyC6IIXO9....'
      Think its easier to put it in a variable. 
	    .EXAMPLE
	    Test-PartnerCustomer -token 'CwsAuth Bearer=ehJcciSRpICJ1bIsGIUkNnV5iJziyC6IIXO9....' -customerID '3ngking1jtejtw'
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
      [parameter(Mandatory=$true)] $customerID,
      $token
    )


    $baseUrl = "https://partner.citrixworkspacesapi.net"
    $Resource = "ping"

    $headers = @{
        Authorization = "$token"
        }

    $Uri = $baseUrl + "/"+ $customerID + "/" + $Resource


    $response = Invoke-RestMethod -Method GET -Uri $Uri -Headers $headers 
    
    return $response
    
}