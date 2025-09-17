#!/bin/bash

# Define the main directories and their corresponding file types
declare -A directories=(
    ["correos"]="eml"
    ["llaves"]="pem crt"
    ["sellos"]="tsq tsr"
    ["otros"]="pdf"
)

# Define the base directory
base_dir="$(pwd)"

# Start creating the index.html file

index_file="$base_dir/index.html"

echo "<!DOCTYPE html>
<html>
<head>
 <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
 <title>Timestamp</title>
 <link rel=\"stylesheet\" href=\"./styles/min.css\" />
</head>
<body>
<div class=\"wrapper\">" > "$index_file"
echo "<h1>Timestamps</h1>" >> "$index_file"

# Loop through each directory type
for dir in "${!directories[@]}"; do
    echo "<h2>$dir</h2>" >> "$index_file"
    echo "<hr>" >> "$index_file"

    # Loop through each file type for the current directory
    for ext in ${directories[$dir]}; do
        # Find files with the current extension and list them
        files=("$base_dir"/*.$ext)
        if [ -e "${files[0]}" ]; then  # Check if there are any files
            for file in "${files[@]}"; do
                echo "<p><a href=$(basename "$file")>"$(basename "$file")"</a></p>" >> "$index_file"
            done
        fi
    done

    
done

pandoc info.md -o info.html

cat info.html >> "$index_file"

echo "</div></body></html>" >> "$index_file"

