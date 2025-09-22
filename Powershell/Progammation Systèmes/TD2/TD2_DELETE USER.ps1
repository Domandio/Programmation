$CSVFile = "C:\Users\faissal\Desktop\data.csv"
$CSVData = Import-CSV -Path $CSVFile -Delimiter ";" -Encoding UTF8

Foreach($Utilisateur in $CSVData){

    $UtilisateurPrenom = $Utilisateur.prenom
    $UtilisateurNom = $Utilisateur.nom
    $UtilisateurLogin = $Utilisateur.login
    $UtilisateurMotDePasse = $Utilisateur.pass
    $UtilisateurGroup = $Utilisateur.groupe
    $PASSWORD= ConvertTo-SecureString –AsPlainText -Force -String $UtilisateurMotDePasse

   

    # Vérifier la présence de l'utilisateur 
    if ( Get-LocalUser | Where-Object {$_.Name -eq $UtilisateurLogin})
    {
        Write-Warning "L'identifiant $UtilisateurLogin existe déjà "
    }
    else
    {
        
        
        New-LocalUser $UtilisateurLogin `
                    -Password $PASSWORD `
                    -Description $UtilisateurGroup

        
    }
 }