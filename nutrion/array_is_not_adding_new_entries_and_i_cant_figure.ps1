ForEach ($Account In $Identity) {
    $List = [System.Collections.Generic.List[System.String]]::New()
    $User = Get-AdUser -Identity $Account -Properties Name, Mail, Manager
    $List.Add("$($User.Name), $($User.Mail)")

    Do {
        $User = Get-AdUser -Identity $User.Manager -Properties Name, Mail, Manager
        $List.Add("$($User.Name), $($User.Mail)")
    } Until ($Null -Eq $User.Manager)
    $CommaList = $List -Join ', '
}
