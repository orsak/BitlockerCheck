##Scritp Realizado por Carlos Castro Moreno##

foreach ($line in get-content C:\users\carlos_castromoreno\Desktop\equipostotal.txt){
    echo $line
    
    $var = (systeminfo /S $line)[13]
    $var
    $length = $var.Length
    $resutl = $var.Substring($length -10, 1 )
    $resutl

    if ($resutl -eq 2){
        write-host portatil
        if (Test-Connection $line )
        {
            echo encendido
            if((manage-bde -status -cn $line c:)|select-string -pattern "Estado de conversi¢n:   Cifrado completo")
            {
                write-host equipo cifrado
            }
            else
            {
                $line >> C:\Users\carlos_castromoreno\Desktop\Equipos\equipos_sin_cifrar.txt
                write-host equipo sin cifrar
            }
        }
        else
        {
            echo apgado
            $line >> C:\Users\carlos_castromoreno\Desktop\Equipo\equipos_apagados.txt
            Write-Host equipo inscrito
        }
    }
    else 
    {
        write-host sobremesa
    }
}
