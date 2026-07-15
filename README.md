# Tess Light Curves Documentation
## Astroinformatics 1 - Juan David Galan Vargas

This repository contains the tools and scripts used to process, clean, and analyze Transiting Exoplanet Survey Satellite (TESS) light curves.

## Data Processing Workflow

The processing workflow is divided into three main stages: acquisition, format transformation, and statistical analysis.

### 1. Data Acquisition and Preliminary Management
*   **Downloading:** 20 light curves in FITS format were downloaded using the `tesscurlsector73lc.sh` shell script.
*   **Initial Conversion:** The FITS files were opened in TOPCAT and exported as CSV files for easier manipulation.
*   **File Management:** To handle this large datasets, shell scripts were developed to:
    *   Generate a master list of all CSV files.
    *   **Split** the file list into smaller batches (e.g., 5 files per batch) to facilitate its processing.

### 2. Formatting and Filtering (Shell Processing)
A specialized shell script using **AWK** was implemented to transform the raw CSV data into a standardized format:
*   **Delimiter Change:** Modified the data delimiter from a comma (`,`) to a space (` `).
*   **Extension Update:** Changed file extensions from `.csv` to `.lc`.
*   **Column Selection:** To optimize processing, only 6 essential columns were retained: `TIME`, `TIMECORR`, `SAP_FLUX`, `SAP_FLUX_ERR`, `PDCSAP_FLUX`, and `PDCSAP_FLUX_ERR`.

### 3. Advanced Analysis and Plotting (Python)
The final analysis stage utilizes Python (Matplotlib and NumPy) for scientific visualization:
*   **Outlier Detection:** Points are identified as outliers if they are **more than 3$\sigma$ away from the median**. The calculation uses a Robust Sigma based on the Median Absolute Deviation (MAD) to ensure stability against extreme values.
*   **Lomb-Scargle Periodograms:** The pipeline implements the Lomb-Scargle method to identify the dominant frequency of the source's variability and estimates its period.
*   **Phase Folding:** Using the calculated best period, the data is transformed from time-space to phase-space (range 0 to 1), significantly improving the readability of periodic signals.
*   **Visualization:** Plots include `errorbar` measurements, median lines, 3$\sigma$ thresholds, and separate markers (stars) for identified outliers.

---

## Test Cases for Processing

To ensure the pipeline functions correctly, the following test cases should be verified:

1.  **Format Transformation Integrity:**
    *   **Input:** A standard TESS CSV file.
    *   **Expected Output:** A `.lc` file with space delimiters containing exactly 6 columns with the correct headers (`TIME`, `SAP_FLUX`, etc.).

2.  **Robust Outlier Identification:**
    *   **Input:** Data with known extreme spikes (e.g., Figure 2 in Practice 3).
    *   **Expected Output:** The script should flag points exceeding $3 \times (1.4826 \times MAD)$ as outliers and render them with distinct "star" markers in the final plot.

3.  **Periodicity Accuracy:**
    *   **Input:** A light curve with a clear sinusoidal or cosine signal (e.g., Figures 1 and 3 in Practice 3).
    *   **Expected Output:** The Lomb-Scargle periodogram should show a high-power peak at the correct period (e.g., $P \approx 0.582$ or $P \approx 0.433$), and the folded light curve should show a coherent, non-random shape.
