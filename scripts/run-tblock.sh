if [[ -z $1 ]]; then
    echo "No directory provided. No op."
    exit 0
fi

script_dir=$( dirname "${BASH_SOURCE[0]}" )

$script_dir/../tblock < $script_dir/../results/$1/delta-tblock.dat > $script_dir/../results/$1/tblock.log