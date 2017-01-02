function Update-WebConfiguration {
<#
.Synopsis
   Updates the IIS app settings section of the web.config file
.DESCRIPTION
   Updates the appsettings section of a IIS web config file.  Can be used to dyanicaml change settings like 
   the sql connection string.
.EXAMPLE
   
.EXAMPLE
   
.EXAMPLE
   
#>
    [cmdletbinding()]
    param (
        [Parameter(Mandatory)]
        [ValidateScript({Test-Path $_ })]
        [string]$Path,

        [Parameter(Mandatory)]
        [string]$Key,

        [Parameter(Mandatory)]
        [string]$Value        
    )

    BEGIN 
    {
        
    }

    PROCESS 
    {
       $webConfig = $Path
       $xmlDoc = (Get-Content $webConfig) -as [Xml]
       $obj = $xmlDoc.configuration.appSettings.add | where {$_.Key -eq $Key }
       $obj.value = $Value
       $xmlDoc.Save($webConfig)
    }

    END 
    {

    }
}








