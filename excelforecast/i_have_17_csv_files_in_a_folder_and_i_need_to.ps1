$PathToCsvFolder = ''
$OutputPath = 'Output.csv'

$Data = Get-ChildItem -Path $PathToCsvFolder -Fitler *.csv |
Select-Object -Property FullName |
Import-Csv |
Where-Object -Property 'Amount Paid' -Eq 'Y'

$Data | Export-Csv -Path $OutputPath
