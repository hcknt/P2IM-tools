#!/bin/bash

timestamp=$(date -Iseconds)
output_file="hexdump_${timestamp}.txt"

rm -f "$output_file"

for file in id*; do
    if [[ -f "$file" ]]; then
        echo "$file" >> "$output_file"
        hexdump -C "$file" >> "$output_file"
        echo "------------------------------------------------------------------------------" >> "$output_file"
    fi
done

echo "Hexdump saved to $output_file"