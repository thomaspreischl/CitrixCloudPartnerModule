function Get-PartnerCustomerEntitledProducts {
    <#
          .SYNOPSIS
          Get connected customer's license entitled Products.
          .DESCRIPTION
          This function gives you connected customer's license entitled Products. name of Products
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
      $Resource = "cloudlicenseusages/manifest"
  
      $headers = @{
          Authorization = "$token"
          }
  
      $Uri = $baseUrl + "/"+ $partnerID + "/" + $Resource + "/" + $customerID 

      $response = Invoke-RestMethod -Method GET -Uri $Uri -Headers $headers 
      $response = $response.cloudLicenseEntitledProducts
      
      return $response
      
  }
  