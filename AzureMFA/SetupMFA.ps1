# PowerShell script to automate MFA setup for users in an M365 tenant

# Import necessary modules
Import-Module Microsoft.Graph.Identity.SignIns
Import-Module Microsoft.Graph.Authentication

# Authenticate to Entra ID
Connect-MgGraph -Scopes "User.Read.All", "Group.ReadWrite.All", "Policy.ReadWrite.ConditionalAccess"

# Assess users without MFA
$usersWithoutMFA = Get-MgUser -Filter "strongAuthenticationDetail/any(a:a/method eq null)"

# Create groups for enforcing MFA
$groupName = "MFAEnforcedUsers"
$group = New-MgGroup -DisplayName $groupName -MailEnabled $false -SecurityEnabled $true -MailNickname $groupName

# Assign users without MFA to the created groups
foreach ($user in $usersWithoutMFA) {
    Add-MgGroupMember -GroupId $group.Id -DirectoryObjectId $user.Id
}

# Create Conditional Access policy to enforce MFA
$policyName = "EnforceMFA"
$policy = New-MgConditionalAccessPolicy -DisplayName $policyName -State "Enabled" -Conditions @{
    Users = @{
        IncludeGroups = @($group.Id)
    }
} -GrantControls @{
    BuiltInControls = @("Mfa")
}
