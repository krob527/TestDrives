# Create a new Windows VM and create a new AD Forest, Domain and DC

This template will deploy a new VM (along with a new VNet, Storage Account and Load Balancer) and will configure it as a Domain Controller and create a new forest and domain.

Click the button below to deploy

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-quickstart-templates%2Fmaster%2Factive-directory-new-domain%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-quickstart-templates%2Fmaster%2Factive-directory-new-domain%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

# Automate MFA Setup for M365 Users

This repository includes a script `SetupMFA.ps1` to automate the setup of Multi-Factor Authentication (MFA) for users in an M365 tenant. The script assesses users without MFA, creates groups, and assigns users to groups that enforce MFA using a Conditional Access policy.

## Prerequisites

1. Install the Entra ID PowerShell module by following the instructions in this [guide](https://learn.microsoft.com/en-us/powershell/entra-powershell/installation).

## Usage

1. Open PowerShell and navigate to the `AzureMFA` directory.
2. Run the `SetupMFA.ps1` script:

```powershell
.\SetupMFA.ps1
```

3. The script will:
   - Assess users without MFA.
   - Create groups for enforcing MFA.
   - Assign users without MFA to the created groups.
   - Create a Conditional Access policy to enforce MFA.
