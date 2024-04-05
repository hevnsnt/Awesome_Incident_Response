<#
.SYNOPSIS
    Active Directory Assessment and Incident Response Script

.DESCRIPTION
    This script performs various Active Directory assessment and incident response tasks to assist in identifying and responding to potential security incidents.

    The script retrieves information about user accounts, computers, GPOs, and group memberships, and saves the results to text files in the specified output directory.
    It also provides options for creating an Active Directory backup and forcing password changes for user accounts.

    The script supports two modes of operation:
    - Passive mode: Retrieves information without making any changes to Active Directory.
    - Active mode: Allows performing actions such as creating an Active Directory backup and forcing password changes.

    The script prompts for user confirmation before executing any active commands.

.NOTES
    Script Name : AD_Response.ps1
    Author      : Bill Swearingen (bill@trifident.com)
    Created On  : 04/04/2024
    Version     : v1.0

.EXAMPLE
    .\aduser.ps1
    Runs the script in passive mode, retrieving information about Active Directory without making any changes.

.EXAMPLE
    .\aduser.ps1 --active
    Runs the script in active mode, allowing the creation of an Active Directory backup and forcing password changes for user accounts.

.LINK
    https://github.com/hevnsnt/Awesome_Incident_Response

#>

##### USER DEFINDED VARIABLES #####
# Set the output directory
$outputDirectory = "output"

# Set the default date
$defaultDate = "03/01/2024"
#####-END USER DEFINDED VARIABLES-#####

# Function to display the logo
function Show-Logo {
    Write-Host @"                                                                           
                                                                                                @@@      
                                                                                             @@@ @ @@@@  
                                                                                           @@@ @ @@@ @   
                                                                                        @@@@ @@@@ @  @@@ 
                                                                                     /@@@ @@@@  @@@@@ @  
                                                                                  #@@. @@@@ @@@@@ &@     
                                                                               @@@@@@@@  @@@   @@@@@@&   
                                                                            @@@@@@@@@@@@  @@@@@@ @@      
                                                                         @@@@@@@@@@@@@@@@   @@@@@@       
                                                                      @@@@@@@@@@@@@ %@@@@@   @@          
                                                  @@               @@@@    @@@@@@@@   @@@@@@@.@          
                                             @@@@ @@@@          @@@@       @@@@@@@@      @@              
                                          @@@     @@@@@@      @@@@       @@@@@@@@@@@@  @                 
                                       @@@@            @@@   @@@       @@@@@@@@@@@@@@ @                  
                                       @@               @@@ @@@       @@@@@@@  @@@@                      
                                        @@              @@@@@@      @@@@@@@@@@  @@                       
                                         @@              @@@@      @@@@@@@@@@@@                          
                                          @(          /@@@        @@@@@    @                             
                                          @@       @@@@          @@@@@@@@ @                              
                                          @ @@@@@@@#             /@@@@@@@                                
                                        @@@@@@@                    @@@@ @                                
                                      @  @@@@@                       @@@@                                
                                    @  @@@@             @@/            @@@@@@                            
                                   @ %@@ @@  @@@@@@@@,   @@         ,@@@@@@@@@@@@@@@@@@@@@@@@@@@         
                                    @ @@         @@@@@  @@@@@@@@@@@  ,@@@@@@@@@@@@,@@% ,@@@@@@@          
                                     @           @@@@@ @@                  &@@& @@  @@@@@@               
                                                @@@@@@@*                                                 
                                               @@@ @@         TRIFIDENT VALIDATION                                           
                                            @@   @       - ACTIVE DIRECTORY ASSESSMENT -                                            
                                         @@ @@@@@                                                         
                                             @                       
"@
}

function LogMessage {
    param(
        [string]$Message,
        [string]$ErrorMessage
    )

    # Get current timestamp in UTC
    $TimestampUtc = (Get-Date).ToUniversalTime().ToString("yyyy-MM-dd HH:mm:ss UTC")

    # Convert UTC timestamp to Eastern time
    $TimeZone = [System.TimeZoneInfo]::FindSystemTimeZoneById("Eastern Standard Time")
    $TimestampEastern = [System.TimeZoneInfo]::ConvertTimeFromUtc([DateTime]::ParseExact($TimestampUtc, "yyyy-MM-dd HH:mm:ss UTC", $null), $TimeZone).ToString("yyyy-MM-dd HH:mm:ss EST")

    # Format log message with both timestamps
    $LogMessage = "[$TimestampUtc | $TimestampEastern] $Message"
    if ($ErrorMessage) {
        $LogMessage = "[!] $LogMessage Error: $ErrorMessage"
        Write-Host $LogMessage -ForegroundColor Red
    } elseif ($ErrorMessage -eq '') {
        $LogMessage = "[+] $LogMessage"
        Write-Host $LogMessage -ForegroundColor DarkGray
    }

    # Append log message to log file
    Add-Content -Path "logfile.txt" -Value $LogMessage
}

# Log starting message
LogMessage "Starting script execution..." ""

# Call the function to display the logo and begin tests
Show-Logo

# Display help information if the --help flag is passed
if ($args -contains "--help") {
    Write-Host "Active Directory Assessment and Incident Response Script"
    Write-Host "This script performs various Active Directory assessment and incident response tasks."
    Write-Host ""
    Write-Host "Usage: .\script.ps1 [--active] [--help]"
    Write-Host ""
    Write-Host "Options:"
    Write-Host "  --active    Enables active mode, which allows the script to perform active actions such as forcing password changes and creating an Active Directory backup."
    Write-Host "  --help      Displays this help information."
    Write-Host ""
    Write-Host "Description:"
    Write-Host "  This script assists in assessing and responding to Active Directory incidents. It performs the following tasks:"
    Write-Host "  - Retrieves accounts created after a specified date"
    Write-Host "  - Retrieves users with administrative rights"
    Write-Host "  - Retrieves computers added to the domain after a specified date"
    Write-Host "  - Retrieves GPOs created after a specified date"
    Write-Host "  - Retrieves inactive users"
    Write-Host "  - Retrieves service accounts"
    Write-Host "  - Retrieves normal user accounts"
    Write-Host "  - Checks for unauthorized group memberships"
    Write-Host "  - Checks for unauthorized changes to GPOs"
    Write-Host ""
    Write-Host "  In active mode (--active flag), the script additionally allows:"
    Write-Host "  - Creating a full Active Directory backup"
    Write-Host "  - Forcing password change on next login for all users"
    Write-Host ""
    Write-Host "  The script prompts for user confirmation before performing any active actions."
    Write-Host ""
    Write-Host "Notes:"
    Write-Host "  - The script requires administrative privileges to run."
    Write-Host "  - It is recommended to run this script in a test environment before using it in a production environment."
    Write-Host "  - Ensure that you have the necessary permissions and authority to perform the actions carried out by the script."
    Write-Host ""
    Write-Host "Example:"
    Write-Host "  .\script.ps1 --active"
    Write-Host "  Runs the script in active mode, enabling all assessment and incident response actions."
    exit
}

# Check if the Active Directory module is installed
if (-not (Get-Module -ListAvailable -Name ActiveDirectory)) {
    Write-Host "The Active Directory PowerShell module is not installed. Please install it before running this script." -ForegroundColor Red
    Write-Host "You can install the Active Directory module by running the following command as an administrator:" -ForegroundColor Yellow
    Write-Host "    Install-WindowsFeature RSAT-AD-PowerShell" -ForegroundColor Yellow
    Write-Host "After installing the module, please rerun this script." -ForegroundColor Yellow
    exit
}

# Function to check if the user has permission to run the command
function Test-Permission {
    param (
        [string]$Command
    )

    try {
        # Log command about to be executed
        LogMessage "Running command: $Command"
        
        # Try running the command
        Invoke-Expression $Command -ErrorAction Stop
        LogMessage "Command executed successfully." ""
        return $true
    }
    catch {
        $errorMessage = $_.Exception.Message
        LogMessage "Error running command:" $errorMessage
        return $false
    }
}

# Check if the current user has administrative privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    LogMessage "Error: You must run this script with administrative privileges." ""
    exit
}

# Check if the --active flag is passed
$activeFlag = $false
if ($args -contains "--active") {
    $activeFlag = $true
    LogMessage "Active mode enabled." ""
}

function Select-Date {
    param (
        [string]$DefaultDate
    )

    # Ask the user if they want to change the default date
    $changeDate = Read-Host "The search date is set to $DefaultDate. Would you want to change it? (Y/N)"

    if ($changeDate -eq "Y") {
        # Prompt the user to enter a new date
        $newDate = Read-Host "Enter the new date (MM/DD/YYYY) to search for"

        # Validate the date format
        $dateRegex = "^\d{2}/\d{2}/\d{4}$"

        if ($newDate -match $dateRegex) {
            LogMessage "Search date changed to: $newDate" ""
            return $newDate
        }
        else {
            Write-Host "Invalid date format. Please enter a valid date in the format MM/DD/YYYY." -ForegroundColor Yellow
            LogMessage "Invalid date format. Re-running the date selection function." ""
            return Select-Date -DefaultDate $DefaultDate
        }
    }
    else {
        LogMessage "Using the default search date: $DefaultDate" ""
        return $DefaultDate
    }
}

# Call the Select-Date function to get the selected date
$selectedDate = Select-Date -DefaultDate $defaultDate

# Convert the selected date to a DateTime object
$searchDate = [DateTime]::ParseExact($selectedDate, "MM/dd/yyyy", $null)

# Create the output directory if it doesn't exist
if (-not (Test-Path $outputDirectory)) {
    New-Item -ItemType Directory -Path $outputDirectory | Out-Null
}

try {

    #################### PASSIVE COMMANDS ######################

    # Get accounts created after the selected date and save to "suspicious_users.txt"
    Write-Host ""
    Write-Host "This section retrieves user accounts that were created after the specified date and saves the results to '$outputDirectory\suspicious_users.txt'. It includes the username and creation date of each suspicious user account."
    LogMessage "Retrieving user accounts created after $selectedDate..."
    if (Test-Permission "Get-ADUser -Filter {Created -ge '$searchDate'} | Select-Object SamAccountName, Created | Out-File -FilePath '$outputDirectory\suspicious_users.txt'") {
        LogMessage "Suspicious user accounts saved to '$outputDirectory\suspicious_users.txt'."
    }

    # Get users with Admin rights and save to "admin_users.txt"
    Write-Host ""
    Write-Host "This section retrieves users who are members of the 'Administrators' group and saves the results to '$outputDirectory\admin_users.txt'. It includes the username of each user with administrative rights."
    LogMessage "Retrieving users with administrative rights..."
    if (Test-Permission "Get-ADGroupMember -Identity 'Administrators' | Select-Object SamAccountName | Out-File -FilePath '$outputDirectory\admin_users.txt'") {
        LogMessage "Users with administrative rights saved to '$outputDirectory\admin_users.txt'."
    }

    # Get computers added to the domain since the selected date and save to "joined_computers.txt"
    Write-Host ""
    Write-Host "This section retrieves computers that were added to the domain after the specified date and saves the results to '$outputDirectory\joined_computers.txt'. It includes the computer name and the date when it was added to the domain."
    LogMessage "Retrieving computers added to the domain after $selectedDate..."
    if (Test-Permission "Get-ADComputer -Filter {whenCreated -ge '$searchDate'} | Select-Object Name, whenCreated | Out-File -FilePath '$outputDirectory\joined_computers.txt'") {
        LogMessage "Computers added to the domain saved to '$outputDirectory\joined_computers.txt'."
    }

    # Get GPOs modified within the last 60 days and save reports to HTML file
    Write-Host ""
    Write-Host "This section retrieves Group Policy Objects (GPOs) that were modified within the last 60 days and saves the reports to '$outputDirectory\Report.html'. It includes the display name and modification time of each recently modified GPO."
    LogMessage "Retrieving GPOs modified within the last 60 days..."
    $getGpoCommand = "Get-GPO -All | Where-Object { `$_.ModificationTime -ge (Get-Date).AddDays(-60) } | ForEach-Object { Get-GPOReport -Name `$_.DisplayName -ReportType HTML }"

    if (Test-Permission "$getGpoCommand > '$outputDirectory\Report.html'") {
        LogMessage "GPO reports for GPOs modified within the last 60 days saved to '$outputDirectory\Report.html'."
    }

    # Get inactive users (not logged in for 60 days) and save to "inactive_users.txt"
    Write-Host ""
    Write-Host "This section retrieves user accounts that have not logged in for the past 60 days and saves the results to '$outputDirectory\inactive_users.txt'. It includes the username and the last logon date of each inactive user account."
    LogMessage "Retrieving inactive users..."
    $inactiveDate = (Get-Date).AddDays(-60)
    if (Test-Permission "Get-ADUser -Filter {LastLogonDate -lt '$inactiveDate'} | Select-Object SamAccountName, LastLogonDate | Out-File -FilePath '$outputDirectory\inactive_users.txt'") {
        LogMessage "Inactive users saved to '$outputDirectory\inactive_users.txt'."
    }

    # Get service accounts and save to "service_accounts.txt"
    Write-Host ""
    Write-Host "This section retrieves user accounts that are designated as service accounts based on their description containing the word 'service'. It saves the results to '$outputDirectory\service_accounts.txt', including the username and description of each service account."
    LogMessage "Retrieving service accounts..."
    if (Test-Permission "Get-ADUser -Filter {Description -like '*service*'} | Select-Object SamAccountName, Description | Out-File -FilePath '$outputDirectory\service_accounts.txt'") {
        LogMessage "Service accounts saved to '$outputDirectory\service_accounts.txt'."
    }

    # Get normal user accounts and save to "target_accounts.txt"
    Write-Host ""
    Write-Host "This section retrieves regular user accounts that are enabled and not designated as service accounts. It saves the results to '$outputDirectory\target_accounts.txt', including the username and description of each normal user account."
    LogMessage "Retrieving normal user accounts..."
    $filter = "Enabled -eq `$true -and Description -notlike '*service*'"

    # Use the filter in the Get-ADUser command
    if (Test-Permission "Get-ADUser -Filter {$filter} | Select-Object SamAccountName, Description | Out-File -FilePath '$outputDirectory\target_accounts.txt'") {
        LogMessage "Normal user accounts saved to '$outputDirectory\target_accounts.txt'."
    }

    # Check for unauthorized group memberships
    Write-Host ""
    Write-Host "This section retrieves the members of the 'Domain Admins' group and saves the results to '$outputDirectory\domain_admins.txt'. It includes the username of each member in the 'Domain Admins' group."
    LogMessage "Checking for unauthorized group memberships..."
    if (Test-Permission "Get-ADGroupMember -Identity 'Domain Admins' | Select-Object SamAccountName | Out-File -FilePath '$outputDirectory\domain_admins.txt'") {
        LogMessage "Domain Admins group membership saved to '$outputDirectory\domain_admins.txt'." 
    }

    # Check for unauthorized changes to GPOs
    Write-Host ""
    Write-Host "This section retrieves all GPOs and generates an XML report for each GPO. It saves the combined report to '$outputDirectory\gpo_report.xml'. This allows for reviewing any unauthorized modifications made to GPOs."
    LogMessage "Checking for unauthorized changes to GPOs..."
    $getGpoCommand = "Get-GPO -All | ForEach-Object { Get-GPOReport -Name `$_.DisplayName -ReportType XML }"

    if (Test-Permission "$getGpoCommand | Out-File -FilePath '$outputDirectory\gpo_report.xml'") {
        LogMessage "GPO report saved to '$outputDirectory\gpo_report.xml'."
    }



    #################### ACTIVE COMMANDS ######################

    if ($activeFlag) {
        # Ask the user if they want to perform a full Active Directory backup
        $confirmBackup = Read-Host "`nA full Active Directory backup includes:`n- Active Directory database (NTDS.DIT)`n- Active Directory transaction log files`n- SYSVOL folder`n- Registry`nThe backup can be used for disaster recovery or to restore Active Directory to a previous state if needed. `nDo you want to perform a full Active Directory backup? (Y/N)"
    
        if ($confirmBackup -eq "Y") {
            # Get the current working directory
            $currentDirectory = Get-Location
    
            # Ask the user if they want to save the backup in the current directory
            $useCurrentDirectory = Read-Host "The current working directory is: '$currentDirectory'. `nDo you want to save the backup in this directory? (Y/N)"
    
            if ($useCurrentDirectory -eq "Y") {
                $backupDirectory = $currentDirectory
            }
            else {
                $backupDirectory = Read-Host "Enter the backup directory path:"
            }
    
            # Validate the backup directory path
            if (-not (Test-Path $backupDirectory)) {
                LogMessage "Error: The specified backup directory path is invalid or inaccessible." ""
            }
            else {
                $ntdsutilCommand = "ntdsutil 'activate instance ntds' 'ifm' 'create full $backupDirectory\ntbackup' quit quit"
                $ntdsutilOutput = Invoke-Expression "$ntdsutilCommand 2>&1"
                LogMessage "ntdsutil command output: $ntdsutilOutput" ""
                $ntdsutilExe = "ntdsutil.exe"
                $ntdsutilArgs = "'activate instance ntds' 'ifm' 'create full $backupDirectory' quit quit"
            }
        }
    }
    function ForcePasswordChangeOnNextLogon {
        param (
            [string[]]$TargetUsers
        )
    
        # Initialize arrays to store the processed and pending users
        $processedUsers = @()
        $pendingUsers = @()
    
        # Check if the "processed_users.txt" file exists
        if (Test-Path "$outputDirectory\processed_users.txt") {
            # Read the list of processed users from "processed_users.txt"
            $processedUsers = Get-Content -Path "$outputDirectory\processed_users.txt"
        }
    
        # Filter out the processed users from the target users
        $pendingUsers = $TargetUsers | Where-Object { $_ -notin $processedUsers }
    
        # Get the count of pending users
        $pendingUserCount = $pendingUsers.Count
    
        # Ask the user to confirm the number of accounts to reset
        $confirmReset = Read-Host "Do you want to force password change on next login for $pendingUserCount user accounts? (Y/N)"
    
        if ($confirmReset -eq "Y") {
            # Force password change for each pending user
            foreach ($user in $pendingUsers) {
                $user = $user.Trim()
                if (Test-Permission "Get-ADUser -Identity $user | Set-ADUser -ChangePasswordAtLogon ([System.Boolean]::True)") {
                    # Proceed if the user has permission
                    LogMessage "User '$user' will be prompted to change password at next logon." ""
                    $processedUsers += $user
                }
                else {
                    LogMessage "Failed to force password change for user '$user'." ""
                }
            }
    
            # Save the list of processed users to "processed_users.txt"
            $processedUsers | Out-File -FilePath "$outputDirectory\processed_users.txt" -Encoding UTF8 -Force
    
            LogMessage "Password change on next login has been enforced for processed users." ""
        }
        else {
            LogMessage "Password change on next login has been skipped." ""
        }
    }
    

    if ($activeFlag) {
        # This script forces a password change on next login for users in "target_accounts.txt"
        # Inside the function, the script initializes the $processedUsers and $pendingUsers arrays, reads the processed users from the "processed_users.txt" file (if it exists), 
        # and filters out the processed users from the target users. 
        # The script then iterates over each pending user using a foreach loop. For each user, it attempts to force the password change on next logon using the Get-ADUser and Set-ADUser cmdlets. 
        # If the permission check passes, a log message is recorded, and the user is added to the $processedUsers array. If the permission check fails, a log message is recorded.
        # After processing each user, the script saves the list of remaining pending users (excluding the current user) to the "pending_users.txt" file using the Out-File cmdlet. 
        # This ensures that if the script fails or dies during execution, the pending users are saved, and the script can resume from where it left off.
        # After processing all pending users, the list of processed users is saved to the "processed_users.txt" file.
        $confirmPasswordChange = Read-Host "Do you want to force password change on next login for users in '$outputDirectory\target_accounts.txt'? (Y/N)"
        if ($confirmPasswordChange -eq "Y") {
            # Read the list of users from "target_accounts.txt", skipping the first two lines
            $targetUsers = Get-Content -Path "$outputDirectory\target_accounts.txt" | Select-Object -Skip 2 | ForEach-Object {
                # Trim each line and extract the SamAccountName
                $trimmedUser = $_.Trim().Split(' ')[0]
                # Output the trimmed user if it's not empty
                if (-not [string]::IsNullOrWhiteSpace($trimmedUser)) {
                    $trimmedUser
                }
            }


            # Call the ForcePasswordChangeOnNextLogon function
            ForcePasswordChangeOnNextLogon -TargetUsers $targetUsers
        }
    }

    LogMessage "Script execution completed." ""
}
catch {
    $errorMessage = $_.Exception.Message
    LogMessage "An error occurred during script execution: $errorMessage" ""
    LogMessage "Script execution terminated." ""
}