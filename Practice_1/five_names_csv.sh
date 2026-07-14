input_file="csv_files_names.txt"
number_names=5

split -l $number_names -d --additional-suffix=.txt "$input_file" parte_
ls parte_*.txt
