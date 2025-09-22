$formation = Read-Host "Entrez votre formation"

if ($formation -eq "Admisys")
{ 
    Write-Output "Bienvenue les $Formation $(Get-Date)"   
}
Else
{
    Write-Output "Oups $formation !"
}