if [[ -z $1 ]]; then
    echo "No directory provided. No op."
    exit 0
fi

script_dir=$( dirname "${BASH_SOURCE[0]}" )
target_dir=$script_dir/../results/$1

mkdir -p $script_dir/temp
cp $target_dir/tblock.log $script_dir/temp/tblock-$1.log
cat $script_dir/temp/tblock-$1.log

if [[ $2 -eq 1 ]]; then
    rm -r $script_dir/temp/
fi