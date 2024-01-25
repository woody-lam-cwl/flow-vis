script_dir=$( dirname "${BASH_SOURCE[0]}" )

find $script_dir/../results/ -type f -name coefficients.csv

while IFS= read -r line; do
    if [[ ! -z $line ]]; then
        echo $line
        tail -3 "$script_dir/$line"   
    fi
done < $(find $script_dir/../results/ -type f -name coefficients.csv)