function run_deltagen() {
    name=$1
    mach=$2
    reynolds=$3
    aoa=$4
    sweep=$5
    grid_scale=$6
    half_span=$7
    height_ratio=$8
    time_factor=$9
    smooth_factor=$10
    steps=10000
    wing_type=$11

    script_dir=$( dirname "${BASH_SOURCE[0]}" )
    input=$'$name\n$mach\n$reynolds\n$aoa\n$sweep\n$grid_scale\n$half_span\n$height_ratio\n$time_factor\n$smooth_factor\n$steps\n$wing_type\n'
    echo $"Running deltagen with input:"
    echo "${input}"
    $script_dir/../deltagen <<< $input > /dev/null
    echo "Deltagen complete"
    echo $input > $script_dir/../results/$name/run_configurations.dat
}

function run_tblock() {
    if [[ -z $1 ]]; then
        echo "No directory provided. No op."
        exit 0
    fi

    script_dir=$( dirname "${BASH_SOURCE[0]}" )
    target_dir=$script_dir/../results/$1

    echo "Running tblock on path ${target_dir}"
    $script_dir/../tblock < $target_dir/delta-tblock.dat > $target_dir/tblock.log
    echo "Run completed for path ${target_dir}"
}

run_deltagen $1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11
run_tblock $1