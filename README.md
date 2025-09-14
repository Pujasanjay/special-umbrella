Informatics_573 Shell Script

- Programmer: Puja Sanjay Thorat  
- Language: Bash shell script (.sh)
- Script filename: `informtics_573.sh`  
- Version: Linux enterprise server 15SP3 
- Date submitted: 13 September 2025  
- Purpose: This shell script automates the process of downloading, unzipping, and summarizing human chromosome 1 secondary assemblies (excluding chr1.fa.gz) from the UCSC Genome Browser. It also generates a summary file containing file details, first 10 lines, and total line count for each assembly. The script is fully independent and can run on any Bash-compatible system. 

Files Required
chromosome_download.sh – The main shell script that performs all tasks.
README.md – Documentation file explaining the script, usage instructions, and requirements.

Software / Packages Required
Bash (any version compatible with Linux/Mac)
wget – For downloading files from the web
gzip – For decompressing .gz files
ls, head, wc – Standard Unix utilities (usually pre-installed)

Instructions to Run the Script
Download or clone the repository containing the shell script.
Open a terminal in the directory containing chromosome_download.sh.
Ensure the script has execution permission:
chmod +x chromosome_download.sh
Run the script:
./chromosome_download.sh
The script will:
Navigate to your home directory
Create a folder named Informatics_573
Download all human chromosome 1 secondary assemblies (excluding chr1.fa.gz) from UCSC

Unzip all downloaded files
Create a data_summary.txt file with:
Detailed file information (name, size, permissions)
First 10 lines of each assembly
Total line count for each assembly

Files Created by Script
Informatics_573/ – Main directory containing all downloaded assemblies.
data_summary.txt – A comprehensive summary file including:
File names
File permissions
File sizes
First 10 lines of each assembly
Total number of lines per assembly

Notes / Important Information
Make sure you have an active internet connection for downloading files.
The script automatically handles .gz decompression.
Running the script multiple times will overwrite the data_summary.txt file.
Designed to work on any Bash-compatible system without additional modifications.
3 or choose another workdir.
If data_summary.txt looks empty: ensure the script ran to completion without error and check for .fa files in the directory.
