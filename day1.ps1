$input_elfcal = (Get-Content -path "./input/day1.txt" -Raw) -split "\r\n\r\n" # get as a string, not as a whole list

$elf_dict = @{}  # remember: DOS newline encoding is \r\n, unix is \n
$elves = 0 # basic iterator
foreach ($elf in $input_elfcal){
    $elf_dict["Elf$elves"] = & { # is a dictionary the best choice? who cares. anyway this makes a new key with the return value of the script block
        $total_cals = 0
        foreach ($food_cals in $elf -Split("\r\n")){ # sums the calories of all foods the elf is carrying
            $total_cals += [int]$food_cals # casting probably overkill but you know implicit typed languages
        }
        $total_cals
    }
    $elves++
}
Write-Host "______`n`nPART ONE: Top elf:" 
$elf_dict.GetEnumerator() | Sort-Object Value | Select-Object -Last 1 # sort them by ascending value, get last entry (highest entry)
Write-Host "______`n`nPART TWO: Top 3 elves carry this many calories total: " -NoNewline
& {
    $total # initalize variable to NULL, which == 0 in powershell
    foreach ($calorie_count in $($elf_dict.GetEnumerator() | Sort-Object Value | Select-Object -Last 3).Value) { # sort them by ascending value, get only the values of the last 3 entries
        $total += $calorie_count
    }
    $total
} 