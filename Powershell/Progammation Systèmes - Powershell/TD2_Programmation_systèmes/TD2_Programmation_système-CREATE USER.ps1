$CSVFile = "C:\Users\user\Desktop\LISTE UTILISATEURS\data.csv"
$CSVData = Import-Csv -Path $CSVFile -delimiter ";" -Encoding UTF8

foreach ($Utilisateur in $CSVData) 
    {
    $UtilisateurPrenom = $Utilisateur.prenom
    $UtilisateurNom = $Utilisateur.nom
    $UtilisateurLogin = $Utilisateur.login
    $UtilisateurMotDePasse = $Utilisateur.pass
    $UtilisateurGroup = $Utilisateur.groupe
    $PASSWORD =ConvertTo-SecureString -AsPlainText -Force -String $UtilisateurMotDePasse

#Test user in localusers

    if (Get-LocalUser |Where-Object {$_.Name -eq $UtilisateurLogin})
        {
        Write-Warning "L'identifiant $UtilisateurLogin existe déjà !"
        }
    else
        {
        New-LocalUser $UtilisateurLogin -Password $PASSWORD -Description $UtilisateurGroup
        }
    }