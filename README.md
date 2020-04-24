## WebJob template

This is a simple template that will allow to call a POST endpoint to do some job. The file structure is meant to be deployed via Octopus. More information about triggered webjobs can be found [here](https://octopus.com/docs/deployment-examples/azure-deployments/deploying-a-package-to-an-azure-web-app/deploying-web-jobs).

In this case, I called it "sync-users" as an example, but it have any other name.

Here's a description of what file does:

- settings.job - contains a CRON expression that will be then parsed by Azure. Note that Azure's expressions are slightly different as traditional ones. More info [here](https://docs.microsoft.com/en-us/azure/app-service/webjobs-create#ncrontab-expressions).
- sync-users.config - an XML file with Octopus' placeholders to be replaced by their real value at deployment time. 
- sync-users.ps1 - PowerShell script with the actual API call. This assumes that the API authentication method is Basic HTTP Auth. 
