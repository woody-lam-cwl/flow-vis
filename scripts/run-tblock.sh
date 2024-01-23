if [[ -z $1 ]]; then
    echo "No directory provided. No op."
    exit 0
fi

script_dir=$( dirname "${BASH_SOURCE[0]}" )
target_dir=$script_dir/../results/$1

echo "Running tblock on path ${target_dir}"
$script_dir/../tblock < $target_dir/delta-tblock.dat > $target_dir/../results/$1/tblock.log &