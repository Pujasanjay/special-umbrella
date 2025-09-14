#!/bin/bash
# Script: informtics_573.sh
# Author: Puja
# Purpose: Download and process UCSC chromosome 1 secondary assemblies
# Date: 2025-09-12

# Navigate to the user's home directory
cd ~

# Create and navigate to Informatics_573 directory
mkdir -p Informatics_573
cd Informatics_573

# UCSC chromosome 1 secondary assemblies base URL
BASE_URL="https://hgdownload.soe.ucsc.edu/goldenPath/hg38/chromosomes/"

# List of all 21 chromosome 1 assemblies except chr1.fa.gz
FILES=(
  "chr1_KI270706v1_random.fa.gz"
  "chr1_KI270707v1_random.fa.gz"
  "chr1_KI270708v1_random.fa.gz"
  "chr1_KI270709v1_random.fa.gz"
  "chr1_KI270710v1_random.fa.gz"
  "chr1_KI270711v1_random.fa.gz"
  "chr1_KI270712v1_random.fa.gz"
  "chr1_KI270713v1_random.fa.gz"
  "chr1_KI270714v1_random.fa.gz"
  "chr1_KI270715v1_random.fa.gz"
  "chr1_KI270716v1_random.fa.gz"
  "chr1_KI270717v1_random.fa.gz"
  "chr1_KI270718v1_random.fa.gz"
  "chr1_KI270719v1_random.fa.gz"
  "chr1_KI270720v1_random.fa.gz"
  "chr1_KI270721v1_random.fa.gz"
  "chr1_KI270722v1_random.fa.gz"
  "chr1_KI270723v1_random.fa.gz"
  "chr1_KI270724v1_random.fa.gz"
  "chr1_KI270725v1_random.fa.gz"
  "chr1_KI270726v1_random.fa.gz"
)

# Download each file if it doesn't already exist
for FILE in "${FILES[@]}"; do
    if [ ! -f "$FILE" ]; then
        echo "Downloading $FILE..."
        wget "${BASE_URL}${FILE}"
    else
        echo "$FILE already exists, skipping download."
    fi
done

# Unzip all downloaded files
for FILE in *.gz; do
    if [ -f "$FILE" ]; then
        echo "Unzipping $FILE..."
        gunzip -k "$FILE"  # keep original .gz
    fi
done

# Create or clear data_summary.txt
SUMMARY="data_summary.txt"
> "$SUMMARY"

# Append file details (name, size, permissions) to data_summary.txt
echo "File details:" >> "$SUMMARY"
ls -lh >> "$SUMMARY"

# Append first 10 lines of each chromosome 1 assembly
echo -e "\nFirst 10 lines of each assembly:" >> "$SUMMARY"
for FILE in *.fa; do
    echo -e "\n--- $FILE ---" >> "$SUMMARY"
    head -10 "$FILE" >> "$SUMMARY"
done

# Append file name and total number of lines
echo -e "\nTotal number of lines in each assembly:" >> "$SUMMARY"
for FILE in *.fa; do
    LINES=$(wc -l < "$FILE")
    echo "$FILE : $LINES lines" >> "$SUMMARY"
done

echo "Script completed successfully!"

