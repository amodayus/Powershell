#import list of songs
$songs = import-csv "C:\Users\Amadeus\Desktop\apple3.csv"

#setup counter
$i = 0

ForEach ($item in $songs)

{

    # Assign each property value to a simpler named variable

    $album = $item.("Album")

    $artist = $item.("Authors")

    $path = $item.("Path")

    $song_name = $item.("Title")

    $number = $item.("`#")

    $extension = $item.("File Extension")

    #If metadata artist is diplo or null, skip
    If ($artist -eq "diplo" -Or $artist -eq "" ) { continue }

    #If the file is mp3 or m4a make a new name for it
    If ( $path -like '*.mp3' -Or $path -like '*.m4a') { $newname = "$number - $song_name - $album - $artist$extension" 
    
    Write-Output "$newname"

    Write-Output "[+] Changing Name..."

    #Here we rename the files
    rename-item -path $path -newname $newname

    $i = $i + 1

    $namearray += $newname

    }

}

Write-Output "$i songs in total"