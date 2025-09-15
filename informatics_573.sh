#!/bin/bash
# Script: informatics_573.sh
# Author: Puja Sanjay Thorat
# Purpose: Download and process UCSC chromosome 1 secondary assemblies
# Version: SUSE Linux Enterprise Server (SLES) 15 SP3
# Date: 2025-09-14

# Step 1: Navigate to the user's home directory
cd ~

# Step 2: Create and navigate to Informatics_573 directory
mkdir -p Informatics_573
cd Informatics_573

# Step 3: UCSC chromosome 1 base URL
BASE_URL="https://hgdownload.soe.ucsc.edu/goldenPath/hg38/chromosomes/"

# Step 4: Download UCSC index page
echo "Fetching directory listing from UCSC..."
wget -q "${BASE_URL}" -O index.html

# Step 5: Extract chr1_* secondary assemblies (exclude chr1.fa.gz)
grep -o 'chr1_[^"]*\.fa\.gz' index.html | sort -u > chr1_list.txt

# Step 6: Download each file listed
while read -r FILE; do
    if [ ! -f "$FILE" ]; then
        echo "Downloading $FILE..."
        wget -q "${BASE_URL}${FILE}"
    else
        echo "$FILE already exists, skipping."
    fi
done < chr1_list.txt

# Step 7: Unzip all downloaded files
for FILE in chr1_*.fa.gz; do
    if [ -f "$FILE" ]; then
        echo "Unzipping $FILE..."
        gunzip -k "$FILE"   # keep original .gz file
    fi
done

# Step 8: Create or clear summary file
SUMMARY="data_summary.txt"
> "$SUMMARY"

# Step 9: Append file details (name, size, permissions)
echo "=== File Details ===" >> "$SUMMARY"
ls -lh chr1_* >> "$SUMMARY"

# Step 10: Append first 10 lines of each chromosome 1 assembly
echo -e "\n=== First 10 Lines of Each Assembly ===" >> "$SUMMARY"
for FILE in chr1_*.fa; do
    echo -e "\n--- $FILE ---" >> "$SUMMARY"
    head -n 10 "$FILE" >> "$SUMMARY"
done

# Step 11: Append file name and total number of lines
echo -e "\n=== Line Counts ===" >> "$SUMMARY"
for FILE in chr1_*.fa; do
    LINES=$(wc -l < "$FILE")
    echo "$FILE : $LINES lines" >> "$SUMMARY"
done

# Step 12: Clean up helper files
rm -f index.html chr1_list.txt

echo "✅ Script completed successfully. Check 'data_summary.txt'."
