
Function Connect-CitrixAPI{
	<#
	    .SYNOPSIS
	    Authenticates to Citrix Cloud API and get the CwsAuth Bearer Token back.
	    .DESCRIPTION
	    The function uses the Invoke-RestMethod command to make the authorization on Citrix Cloud API and obtain CwsAuth Bearer Token to use it in other functions. Token valid for 60 minutes
	    .PARAMETER partnerID
	    partnerID of your Citrix Cloud Tenant is mandatory to connect to the right Tenant.
        .PARAMETER ClientID
	    clientID of your API-Key created from Citrix Cloud Tenant identity.
        .PARAMETER ClientID
	    clientSecret of your API-Key created from Citrix Cloud Tenant identity.
	    .EXAMPLE
	    Connect-CitrixAPI -partnerID '3asdf21' -ClientID 'no23j4m-352e-4fa1-a900-123sdf123' -ClientSecret '3k3l-1jk54J123nd-GKAGhZUQ=='
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
      [parameter(Mandatory=$true)] $clientID,
      [parameter(Mandatory=$true)] $clientSecret
    )


    $Uri = 'https://trust.citrixworkspacesapi.net/' + $partnerID + '/tokens/clients'


#create a hash table for the body and headers

    $headers = @{ 
            "Accept" = "application/json";
            "Content-Type" ="application/json";
                }
    $body = @{ 
             "ClientId" = "$clientID";
             "ClientSecret" = "$clientSecret";
              }

#must convert the body to JSON, otherwise you get error "Invoke-RestMethod : {"message":"The request is invalid.","modelState":{"credentials":["An error has occurred."]}}"
#To show the whole response, comment out the next line and use this instead: Invoke-RestMethod -Method 'Post' -Uri $uri -Body (ConvertTo-Json $body) -Headers $headers
 
$getBearerToken = Invoke-RestMethod -Method 'Post' -Uri $uri -Body (ConvertTo-Json $body) -Headers $headers

$bearerToken = $getBearerToken.token
$bearerPrincipal = "Your Authorization Pricipal is:" + $getBearerToken.principal

Write-Verbose "$bearerPrincipal`r`n" -Verbose

Write-Verbose "Your Authorization header is: " -Verbose
$authHeader = "CwsAuth Bearer=$bearerToken"
Write-Verbose "$authHeader" -Verbose

return $authHeader 

}
