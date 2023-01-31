function Remove-PartnerCustomerXenDesktopService {
  <#
        .SYNOPSIS
        Remove connected customer's XenDesktop Service for Partner.
        .DESCRIPTION
        This function gives you connected customer's enabled Features. name of features
        .PARAMETER partnerID
        partnerID of your Citrix Cloud Tenant is mandatory to connect to the right Tenant.
      .PARAMETER customerID
        customerID of your Citrix Cloud customer is mandatory to get information for the right tenant.
      .PARAMETER token
        token should be the following content:'CwsAuth Bearer=ehJcciSRpICJ1bIsGIUkNnV5iJziyC6IIXO9....'
      Think its easier to put it in a variable. 
        .EXAMPLE
        Get-PartnerCustomerServices -token 'CwsAuth Bearer=ehJcciSRpICJ1bIsGIUkNnV5iJziyC6IIXO9....' -partnerID '3asdf21' -customerID '3ngking1jtejtw'
        .INPUTS
        System.String
        .OUTPUTS
        System.String
        .NOTES
        xxx
        .LINK
        https://twitter.com/CSchnagl
    #>
    param(
      [parameter(Mandatory=$true)] $partnerID,
      [parameter(Mandatory=$true)] $customerID,
      $token
    )

    $baseUrl = "https://partner.citrixworkspacesapi.net"
    $Resource = "resourceproviders/xendesktop/deletetenant"

    $headers = @{
        Authorization = "$token"
        }


    $Uri = $baseUrl + "/"+ $partnerID + "/" + $Resource + "/" + $customerID 

    try{
      $response = Invoke-RestMethod -Method PUT -Uri $Uri -Headers $headers -ea stop
      Write-Verbose 'Service XenDesktop Successfully Removed!' -Verbose
      Write-Verbose $_ -Verbose

      }
      
      catch {
          Write-Verbose 'Not able to Remove Service XenDesktop:' -Verbose
          Write-Verbose $_ -Verbose
      }

  if($response.status -like "NeedMore Action"){
      Write-Verbose 'Service needs More Action! - Check XenDesktop Config' -Verbose
  }

    return $response
    
}
