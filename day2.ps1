$input_guide = (Get-Content -path "./input/day2.txt" -Raw) -split "\r\n" # get the var, split each line into an element of an array

Enum winstate {
    loss = 0
    draw = 3
    win = 6
}

Enum played {
    rock = 1
    paper = 2
    scissors = 3

}

# 2.1
$score = 0
foreach ($entry in $input_guide){ # i so wanted to do this in a cooler way, but switch statements make more sense
    switch ($entry) {
        {$_[0] -eq "A" -And $_[2] -eq "X"} {$score += [int][winstate]::draw + [played]::rock    } # rock vs rock, tie + 1
        {$_[0] -eq "A" -And $_[2] -eq "Y"} {$score += [int][winstate]::win  + [played]::paper   } # rock vs paper, win + 2
        {$_[0] -eq "A" -And $_[2] -eq "Z"} {$score += [int][winstate]::loss + [played]::scissors} # rock vs scissors, loss + 3
        {$_[0] -eq "B" -And $_[2] -eq "X"} {$score += [int][winstate]::loss + [played]::rock    } # paper vs rock, loss + 1
        {$_[0] -eq "B" -And $_[2] -eq "Y"} {$score += [int][winstate]::draw + [played]::paper   } # paper vs paper, tie + 2
        {$_[0] -eq "B" -And $_[2] -eq "Z"} {$score += [int][winstate]::win  + [played]::scissors} # paper vs scissors, won + 3
        {$_[0] -eq "C" -And $_[2] -eq "X"} {$score += [int][winstate]::win  + [played]::rock    } # scissors vs rock, won + 1
        {$_[0] -eq "C" -And $_[2] -eq "Y"} {$score += [int][winstate]::loss + [played]::paper   } # scissors vs paper, loss + 2
        {$_[0] -eq "C" -And $_[2] -eq "Z"} {$score += [int][winstate]::draw + [played]::scissors} # scissors vs scissors, draw + 3
        default {Pause; write-host "$($_[0]) and $($_[2])"}
    }
}
write-host $score

# 2.2

$score = 0
foreach ($entry in $input_guide){ # i so wanted to do this in a cooler way, but switch statements make more sense
    switch ($entry) {
        {$_[0] -eq "A" -And $_[2] -eq "X"} {$score += [int][winstate]::loss + [played]::scissors    } # rock vs rock, tie + 1
        {$_[0] -eq "A" -And $_[2] -eq "Y"} {$score += [int][winstate]::draw  + [played]::rock   } # rock vs paper, win + 2
        {$_[0] -eq "A" -And $_[2] -eq "Z"} {$score += [int][winstate]::win + [played]::paper} # rock vs scissors, loss + 3
        {$_[0] -eq "B" -And $_[2] -eq "X"} {$score += [int][winstate]::loss + [played]::rock    } # paper vs rock, loss + 1
        {$_[0] -eq "B" -And $_[2] -eq "Y"} {$score += [int][winstate]::draw + [played]::paper   } # paper vs paper, tie + 2
        {$_[0] -eq "B" -And $_[2] -eq "Z"} {$score += [int][winstate]::win  + [played]::scissors} # paper vs scissors, won + 3
        {$_[0] -eq "C" -And $_[2] -eq "X"} {$score += [int][winstate]::loss  + [played]::paper    } # scissors vs rock, won + 1
        {$_[0] -eq "C" -And $_[2] -eq "Y"} {$score += [int][winstate]::draw + [played]::scissors   } # scissors vs paper, loss + 2
        {$_[0] -eq "C" -And $_[2] -eq "Z"} {$score += [int][winstate]::win + [played]::rock} # scissors vs scissors, draw + 3
        default {Pause; write-host "$($_[0]) and $($_[2])"}
    }
}
write-host $score