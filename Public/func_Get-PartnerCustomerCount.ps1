function Get-PartnerCustomerCount {
  <#
	    .SYNOPSIS
	    Get the count of customer detailed information.
	    .DESCRIPTION
	    This function gives you the count of customer detailed information. This means, how many customers are managed with the used partner account..
	    .PARAMETER partnerID
	    partnerID of your Citrix Cloud Tenant is mandatory to connect to the right Tenant.
      .PARAMETER token
	    token should be the following content:'CwsAuth Bearer=ehJcciSRpICJ1bIsGIUkNnV5iJziyC6IIXO9....'
      Think its easier to put it in a variable. 
	    .EXAMPLE
	    Get-PartnerCustomerCount -token 'CwsAuth Bearer=ehJcciSRpICJ1bIsGIUkNnV5iJziyC6IIXO9....' -partnerID '3asdf21'
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
    