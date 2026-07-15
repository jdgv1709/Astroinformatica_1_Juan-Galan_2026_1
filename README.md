# Tess Light Curves Documentation
## Astroinformatics 1 - Juan David Galan Vargas  🐈‍⬛

This repository contains the tools and scripts used to process, clean, and do a basic analysis of the Transiting Exoplanet Survey Satellite (TESS) light curves data.

🌠

## Data Processing Workflow

The processing workflow is divided into three main stages: acquisition, format transformation, and statistical analysis, which roughly corresponds to the graded practices 1, 2 and 3, respectively.

### 1. Data Acquisition and Preliminary Management
*   **Downloading:** 20 light curves in FITS format were downloaded using the `tesscurlsector73lc.sh` shell script.
*   **Initial Conversion:** The FITS files were opened in TOPCAT and exported as CSV files for easier manipulation.
*   **File Management:** To handle this large datasets, shell scripts were developed to:
    *   Generate a master list of all CSV files (`csv_names.sh`).
    *   **Split** the file list into smaller batches (5 files per batch) to facilitate its processing (`five_names_csv.sh`).

### 2. Formatting and Filtering (Shell Processing)
A specialized shell script (`task.sh`) using  an **AWK** command was implemented to transform the raw CSV data into a standardized format, with the following changes:
*   **Delimiter Change:** Modified the data delimiter from a comma (`,`) to a space (` `).
*   **Extension Update:** Changed file extensions from `.csv` to `.lc`.
*   **Column Selection:** To optimize processing, only 6 essential columns were retained: `TIME`, `TIMECORR`, `SAP_FLUX`, `SAP_FLUX_ERR`, `PDCSAP_FLUX`, and `PDCSAP_FLUX_ERR`.

### 3. Advanced Analysis and Plotting (Python)
The final analysis stage utilizes Python (especially the Matplotlib library) for scientific visualization:
*   **Outlier Detection:**  Data points are identified as outliers if they are more than 3 $\sigma$ away from the median value of the `PDCSAP_FLUX`. The calculation uses a Robust Sigma based on the Median Absolute Deviation (MAD) to ensure stability against extreme values.
*   **Lomb-Scargle Periodograms:** The Lomb-Scargle method (with the AstroPy library implementation) was used to identify the dominant frequency of the source's variability and estimates its period.
*   **Phase Folding:** Using the calculated best period, the data is transformed from time-space to phase-space (range 0 to 1), significantly improving the readability of periodic signals.
*   **Visualization:** Plots include `errorbar` measurements, median lines, 3 $\sigma$ thresholds, and separate markers (stars) for identified outliers, different linestyles, markers and colors were utilized to help differentiate the data and make the graph friendlier for anyone with sight difficulties.
