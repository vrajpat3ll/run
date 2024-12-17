#!/bin/bash
# Check if the file path is provided as an argument
if [ -z "$1" ]; then
    echo "No file path provided."
    exit 1
fi

# Get the file path and separate filename and extension
filePath="$1"
filename=$(basename "$filePath")
extension="${filename##*.}"
filename="${filename%.*}"
outputFile="${filename}_output.exe"

# Shift to get any additional arguments for the script
shift
args="$@"

# Run file based on its extension
case "$extension" in
    exe)
        echo "Running executable"
        "$filePath" $args
        ;;
    bat)
        echo "Running batch file"
        source "$filePath" $args
        ;;
    cpp)
        echo "Language: C++"
        g++ "$filePath" -o "$outputFile" && "./$outputFile" $args
        ;;
    c)
        echo "Language: C"
        gcc "$filePath" -o "$outputFile" && "./$outputFile" $args
        ;;
    java)
        echo "Language: Java"
        javac "$filePath" && java "$filename" $args
        ;;
    py)
        echo "Language: Python"
        python3 "$filePath" $args
        ;;
    js)
        echo "Language: JavaScript"
        node "$filePath" $args
        ;;
    go)
        echo "Language: GO"
        go run "$filePath" $args
        ;;
    *)
        echo "Unsupported file extension."
        exit 1
        ;;
esac

# Clean up the output file if it was created
if [ -f "$outputFile" ]; then
    rm "$outputFile"
fi
