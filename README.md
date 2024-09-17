# Deploying Bicep Template:

## Requirements:
1. Install Azure PowerShell cmdlets on your local computer. To deploy Bicep files, you need Azure PowerShell version 5.6.0 or later. For more information, see Get started with Azure PowerShell.
2. Install Bicep CLI. Azure PowerShell doesn't automatically install the Bicep CLI. Instead, you must manually install the Bicep CLI.
3. Connect to Azure by using Connect-AzAccount. If you have multiple Azure subscriptions, you might also need to run Set-AzContext. For more information, see Use multiple Azure subscriptions.

## Login as Service Principal:
Make sure the service principal has read permissions on the subscription


```Powershell
$AzCred = Get-Credential -UserName a06362d4-2d02-47d5-a87c-282c814080e4 # Where UseName is the Application ID

Connect-AzAccount -ServicePrincipal -Credential $AzCred -Tenant eead0199-913f-462a-8005-0c1c53ce7839 -Subscription "9087b381-e8ea-4cdd-aaf0-6a79c24cbab6"
```

## Set Context:

```Powershell
Set-AzContext -Tenant "72f988bf-86f1-41af-91ab-2d7cd011db47" -Subscription "17f076ee-acaf-43e4-8c93-55f60fa8d9e4"
```

## Deploy Bicep Template:
```Powershell
New-AzResourceGroupDeployment -Name CaCExampleDeploymentServicePrincipal -ResourceGroupName USX-CAC-POC-rg -TemplateFile ./test.bicep
```

## Graph Explorer Query:
```Graph
GET https://graph.microsoft.com/v1.0/applications?$count=true&$filter=properties/uniqueName eq 'CacBicepTest'
```

## Useful Links:
- https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/file
- https://learn.microsoft.com/en-us/graph/templates/reference/applications?view=graph-bicep-1.0 



## Flow:

### Setup
1. Have a Bicep file in the repo

### Service Side:
1. Create an AAD Application
2. Create a Service Principal
3. Assign roles to the Service Principal
4. Create a credential for the Service Principal
5. Create the Service Principal Credential
6. Create the workflow which processes the Bicep file

### GitHub Side:
1. Az Login as the Service Principal
2. 




## Michael POC Notes:
- Create a Bicep file
- Create an AAD Application Service Principal
- Assign roles to the Service Principal (Contributor on the sub)


## Next steps:
- Manually get a GitHub Workflow to deploy the Bicep file
- Take my changes and bring them to the resx file in a branch
- Add a Checkbox in the UI to support Bicep files
- Deploy to the dev environment and sideload the changes