#!/bin/bash

# Directory containing the CSV files from last practice
SOURCE_DIR="/home/jdgv/Documents/Tareas_JD/Astrofagasta/Magister/Materias/1er Semestre/AstroInformatica 1/Practice_1"
for file in "$SOURCE_DIR"/*.csv; do
    [ -f "$file" ] || continue

    base=$(basename "$file" .csv)
    output="./${base}.lc" #Change of extension

    awk -F',' ' #Change of delimeter from , to  blank space
    NR==1 {
        for (i=1; i<=NF; i++) {
            gsub(/^[ \t"]+|[ \t"]+$/, "", $i) #Go line by line in the CSV FIle

            if ($i=="TIME")             c1=i
            if ($i=="TIMECORR")         c2=i # Columns useful for a light curve (Decided to keep both fluxes and its Errors)
            if ($i=="SAP_FLUX")         c3=i
            if ($i=="SAP_FLUX_ERR")     c4=i
            if ($i=="PDCSAP_FLUX")      c5=i
            if ($i=="PDCSAP_FLUX_ERR")  c6=i
        }
        print "TIME TIMECORR SAP_FLUX SAP_FLUX_ERR PDCSAP_FLUX PDCSAP_FLUX_ERR" #Column names of new files
        next
    }
    {
        print $c1, $c2, $c3, $c4, $c5, $c6 #Line by line, printing the selected columns
    }
    ' "$file" > "$output"
    echo "Created $output"
done
