## list the stored RDP credential, delete the last RDP credentials and replace with the new values

cmdkey /list | ForEach-Object{if($_ -like "*target=TERMSRV/*"){cmdkey /del:($_ -replace " ","" -replace "Target:","")}}

## set the local variables & values

$srv = "1.2.3.4"
$username = "my-user"
$password = "my-password"

## if you want the user to specify credentials just uncomment the following code and remove the original one:

# $srv = Read-Host "Enter machine IP: "
# $username = Read-Host "Enter Username: "
# $password = Read-Host "Enter Password: "

## attempt to connect to the host using the credentials above

cmdkey /generic:TERMSRV/$srv /user:$username /pass:$password
mstsc /v:$srv

