# Bellow command will add all the cd command history to history.txt file
# Select-String -Path ~\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt -Pattern '^cd D:\\Programming' | ForEach-Object { $_.Line.Substring($_.Line.IndexOf(".txt:") + 1).TrimStart("cd ") } | Out-File -FilePath .\history.txt


# Define the path to the history file
$historyFilePath = "~\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt"

# Run the Select-String command and store the result in a variable
# D Directory
$output = Select-String -Path $historyFilePath -Pattern '^cd D:\\Programming' | ForEach-Object { $_.Line.Replace("D:\Programming", "D:\Computer-Science").Substring($_.Line.IndexOf(".txt:") + 1).TrimStart("cd ") }

# C directory
$output = Select-String -Path $historyFilePath -Pattern '^cd C:\\' | ForEach-Object { $_.Line.Substring($_.Line.IndexOf(".txt:") + 1).TrimStart("cd ") }


# Output the result using a for loop
foreach ($item in $output) {
    # check whether $item is a directory or not
    if (-Not (Test-Path $item)) {
        continue
    }
    # Add the item to the zoxide database
    zoxide add $item
}
