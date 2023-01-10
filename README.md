# Citrix Cloud Powershell Module for Partners
On this page you can find more details about the Citrix Cloud Powershell module for partners. Here you can find the description, the changelog and an explanation for the commands implemented so far.

# Functions

## Connect-CitrixAPI
The function uses the Invoke-RestMethod command to make the authorization on Citrix Cloud API and obtain CwsAuth Bearer Token to use it in other functions. Token valid for 60 minutes. You can also use this command to authenticate on Citrix Cloud and use other Powershell or Rest Calls. With the help of the command it is not necessary to download or install the SDK.

### How to use “Connect-CitrixAPI”?
Connect-CitrixAPI -partnerID '3asdf21' -ClientID 'no23j4m-352e-4fa1-a900-123sdf123' -ClientSecret '3k3l-1jk54J123nd-GKAGhZUQ=='

Output:


Your Authorization Pricipal is:thomas.preischl@googlemail.com

Your Authorization header is: 
CwsAuth Bearer=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.....


## Get-PartnerCustomer
This function lists all customers linked to the partner account. Notifications, OrgID, services and much more information can be retrieved here. Also you can get the connectionID or the Type of Customer (e.g. “managed” or not).

### How to use “Get-PartnerCustomer”?
Here you will find examples how to use the command and how to sort the output.

**Example 1:**
Get all information about one customer with specified OrgID

Get-PartnerCustomer -token $authbearer -partnerID $partnerID | Where-Object {$_.OrgID -eq '1234567'}

Output:

notifictionCount    : 0
CustomerInformation : Meister44 GmbH
orgId               : 1234567
customerId          : 3i1tjgnjktew 
type                : Managed
adminFullName       : 
adminEmail          : 
services            : 
federatedDomains    : 
connectionId        : 2920af5-847b632c-3-3adb10-4edf25443f
serviceStates       : {@{serviceName=AccessSecurity; type=Default; quantity=0; state=NotOnboarded; daysToExpiration=}, @{serviceName=Aggregation; type=Default; quantity=0; state=NotOnboarded; daysToExpiration=}, @{serviceName=BrowserService; type=Default; 
                      quantity=0; state=NotOnboarded; daysToExpiration=}, @{serviceName=CAS; type=Default; quantity=0; state=NotOnboarded; daysToExpiration=}...}


**Example 2:**
Filter multiple attributes over all your customers.

Get-PartnerCustomer -token $authbearer -partnerID '3asdf21' | select CustomerInformation, notifictionCount, OrgID

Output:


CustomerInformation                                                  notifictionCount orgId   
 
Meister32 GmbH                                                                      2 66796318
Meister36 GmbH                                                                      0 66796966
Meister99 GmbH                                                                      9 66796317
Muiasd GmbH                                                                         0 66796319
Muiasfd GmbH                                                                       60 66796316
Muster166 GmbH                                                                      0 66796688
Muster163 GmbH                                                                      0 66796686

## Get-PartnerConnectionInfo
With this function the partner – customer link for a specific customer can be displayed. In addition, the OrgID can be retrieved directly.

### How to use “Get-PartnerConnectionInfo”?
Get-PartnerConnectionInfo -token $authbearer -partnerID '3asdf21' -customerID '3ngking1jtejtw'

Output:


connectionId             : b3c00dfc-32b6-4573-863a-2f294a7d4e1f
partnerId                : 3asdf21
customerId               : 3ngking1jtejtw
type                     : Managed
CustomerAdminDisplayName : Meister44 GmbH
CustomerorgId            : 51364727
CustomeradminFullName    : 
CustomerAdminEmail       : 
services                 : 
federatedDomains         : 

## Get-PartnerCustomerCaseCount
This function gives you the number of support tickets for the customer.

### How to use “Get-PartnerCustomerCaseCount”?

Get-PartnerCustomerCaseCount -token 'CwsAuth Bearer=ehJcciSRpICJ1bIsGIUkNnV5iJziyC6IIXO9....' -partnerID '3asdf21' -customerID '3ngking1jtejtw'

Output:


customerId       count statusCode message

3ngking1jtejtw     0    OK 


## Get-PartnerCustomerAccessInfo
This function gives you information, which access type the user which is used for the API key have to the customer tenant.

### How to use “Get-PartnerCustomerAccessInfo”?
Get-PartnerConnectionInfo -token $authbearer -partnerID '3asdf21' -customerID '3ngking1jtejtw'

Output:


VERBOSE: Access Information for customer: Meister44 GmbH

customerId   type statusCode message

3ngking5ejtw Full OK    


## Get-PartnerCustomerConnection
This function gives you the number of support tickets for the customer.

### How to use “Get-PartnerCustomerConnection”?
Get-PartnerCustomerConnection -token 'CwsAuth Bearer=ehJcciSRpICJ1bIsGIUkNnV5iJziyC6IIXO9....' -partnerID '3asdf21' -customerID '3ngking1jtejtw'

Output:


connectionId             : b00fcd3c-32b6-4573-863a-294dea2f174f
partnerId                : 3asdf21
customerId               : 3ngking1jtejtw
type                     : Managed
CustomerAdminDisplayName : Meister44 GmbH
CustomerorgId            : 1234567
CustomeradminFullName    : 
CustomerAdminEmail       : 
PartnerAdminDisplayName  : IT Preischl
PartnerorgId             : 58751256
PartnerAdminFullName     : 
PartnerAdminEmail        : 
services                 : 
federatedDomains         :

## Get-PartnerCustomerCount
This function gives you the count of customer detailed information. This means, how many customers are managed with the used partner account

### How to use “Get-PartnerCustomerCount”?
Get-PartnerCustomerCount -token 'CwsAuth Bearer=ehJcciSRpICJ1bIsGIUkNnV5iJziyC6IIXO9....' -partnerID '3asdf21'

Output:


39

## Get-PartnerCustomerCVADActiveUse
Get the current cloud license active use of cvad for specific customer and also the license type the customer is currently running. How many licenses are used this day and month. Same for the devices if used device license.

### How to use “Get-PartnerCustomerCVADActiveUse”?
Get-PartnerCustomerCVADActiveUse -token 'CwsAuth Bearer=ehJcciSRpICJ1bIsGIUkNnV5iJziyC6IIXO9....' -partnerID '3asdf21' -customerID '3ngking1jtejtw'

Output:

License Active Use Information for customer: Meister44 GmbH
Customer is licensed with User/Device Licenses.

customerId                       : 3ngking1jtejtw
dailyActiveUseValue              : 2868
dailyActiveUsePercentage         : 
monthlyActiveUseValue            : 3896
monthlyActiveUsePercentage       : 
dailyDeviceActiveUseValue        : 2685
dailyDeviceActiveUsePercentage   : 
monthlyDeviceActiveUseValue      : 4985
monthlyDeviceActiveUsePercentage : 
productName                      : XenDesktop
recordingTimeStamp               : 2023-01-10T19:26:51.7601992+00:00


## Get-PartnerCustomerInfo
Get connected customer’s account information for Partner. You will get back the displayname, address, city, phone, etc.

### How to use “Get-PartnerCustomerInfo”?
Get-PartnerCustomerInfo -token 'CwsAuth Bearer=ehJcciSRpICJ1bIsGIUkNnV5iJziyC6IIXO9....' -partnerID '3asdf21' -customerID '3ngking1jtejtw'

Output:


name             : 3ngking1jtejtw
displayName      : Meister44 GmbH
nickname         : Meister44 GmbH
orgId            : 1234567
orgIds           : 
address1         : Meisterstrasse 1123
address2         : Meisterstrasse 1123
address3         : 
addressCity      : Musterstadt
addressCountry   : Germany
addressState     : Bavaria
addressZip       : 84563
mainPhone        : 2363356
mainPhoneArea    : 0049
mainPhoneCountry : 05465
embargoed        : False
memberships      : {}
logoUrl          : 


## Get-PartnerCustomerLogo
If a customer account logo is currently set, you will get it back here.

### How to use “Get-PartnerCustomerLogo”?
Get-PartnerCustomerLogo -token 'CwsAuth Bearer=ehJcciSRpICJ1bIsGIUkNnV5iJziyC6IIXO9....' -partnerID '3asdf21' -customerID '3ngking1jtejtw'

Output:


{Logo}


## Get-PartnerCustomerservicestates
You will get the service state for all existing citrix cloud services. Are the services in production, trial or not onboarded yet. also how many stock order licenses are used. and you will also get the days to expire.

### How to use “Get-PartnerCustomerservicestates”?
Get-PartnerCustomerServiceStates -token 'CwsAuth Bearer=ehJcciSRpICJ1bIsGIUkNnV5iJziyC6IIXO9....' -partnerID '3asdf21' -customerID '3ngking1jtejtw'

Output:


serviceName                : accesssecurity
state                      : Production
type                       : Production
quantity                   : 50
daysToExpiration           : 365
notificationsDisabled      : False
futureEntitlementStartDate : 

serviceName                : aggregation
state                      : Production
type                       : Production
quantity                   : 1
daysToExpiration           : 2913530
notificationsDisabled      : False
futureEntitlementStartDate : 

....

## New-PartnerCustomer
This function creates a new customer by partner and set up the connection between partner and customer. The customer will be automatically linked to your account as partner. Customer Admin also get an email that he now can connect to his tenant.

### How to use “New-PartnerCustomer”?
New-PartnerCustomer -token 'CwsAuth Bearer=eyJhbGc23344ksfdjydfdssInR5cCI6IkpXVCJ9.....' -partnerID '123adsf123' -address 'Meisterstrasse 1123' -addressCity 'Amberg' -addressCountry 'Germany' -addressState 'Bavaria' -addressZip '84563' -companyName 'Meister32 GmbH' -emailAddress 'meister3@mmail.com' -firstName 'Harald' -lastName 'Muellnerer' -phoneNumber '2363356' -countryCode '05465' -areaCode '0049'


Output:


'Customer was successfully created!


name             : 3ngking1jtejtw
displayName      : Meister44 GmbH
nickname         : Meister44 GmbH
orgId            : 1234567
orgIds           : 
address1         : Meisterstrasse 1123
address2         : Meisterstrasse 1123
address3         : 
addressCity      : Musterstadt
addressCountry   : Germany
addressState     : Bavaria
addressZip       : 84563
mainPhone        : 2363356
mainPhoneArea    : 0049
mainPhoneCountry : 05465
embargoed        : False
memberships      : {}
logoUrl          : 
Test-PartnerCustomer
This function checks whether the service is operational.

How to use “Test-PartnerCustomer”?
Test-PartnerCustomer -token 'CwsAuth Bearer=ehJcciSRpICJ1bIsGIUkNnV5iJziyC6IIXO9....' -customerID '3ngking1jtejtw'


Output:


True



# Changelog
2023-01-10:
added the following functions:
Get-PartnerCustomerLogo
Get-PartnerCustomerServiceStates
