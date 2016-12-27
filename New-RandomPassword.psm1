﻿function New-RandomPassword {
<#
.Synopsis
   Generates a random password 
.DESCRIPTION
   This function can be used to generate passwords for AD Accounts or anything requiring a password
.EXAMPLE
   New-RandomPassword -Length 10 
.EXAMPLE
   New-RandomPassword -Length 10 -ExcludeNonAlphabetic
.EXAMPLE
   New-RandomPassword 8
#>
    [cmdletbinding()]
    param (
        [Parameter(Mandatory)]
        [ValidateRange(4,99)] 
        [int]$Length,

        [bool]$ExcludeNonAlphabetic = $false,

        [int]$NonAlphabeticCount
    )

    [Reflection.Assembly]::LoadWithPartialName("System.Web") | Out-Null
    
    if (!($ExcludeNonAlphabetic)) {
        if ($NonAlphabeticCount = 0) {
            $NonNonAlphabeticCount = (($Length * 30 / 100))
        }

        [System.Web.Security.Membership]::GeneratePassword($Length, $NonNonAlphabeticCount)
    }
    else 
    {
        $NonNonAlphabeticCount = 0
        [System.Web.Security.Membership]::GeneratePassword($Length, $NonNonAlphabeticCount) 
    }
}

