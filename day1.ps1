$input_elfcal = (Get-Content -path "./input/day1.txt" -Raw) -split "\r\n\r\n" # get as a string, not as a whole list

$elf_dict = @{}  # remember: DOS newline encoding is \r\n, unix is \n
$elves = 0 # basic iterator
$max = (-1, -1) # record the biggest elf we've seen. Format: (elf, calories held)
foreach ($elf in $input_elfcal){
    $elf_dict["Elf$elves"] = & { # is a dictionary the best choice? who cares. anyway this makes a new key with the return value of the script block
        $total_cals = 0
        foreach ($food_cals in $elf -Split("\r\n")){ # sums the calories of all foods the elf is carrying
            $total_cals += [int]$food_cals # casting probably overkill but you know implicit typed languages
        }
        if ($total_cals -gt [int]$max[1]){ # if the calories on this elf are bigger than the previous biggest elf:
            $script:max = ($elves, $total_cals) # assign new biggest elf and its calorie count. Script keyword needed because scoping just makes $max a new local var otherwise
        }
        $total_cals # return value
    }
    $elves++
}
Write-Host "Elf $($max[0]) has the most calories at $($max[1]), go take food from them :^)"