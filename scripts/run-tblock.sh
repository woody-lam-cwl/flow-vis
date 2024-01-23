function run_deltagen() {
    nl=$'\n'
    name=$@[0]
    mach=$@[1]
    reynolds=$@[2]
    aoa=$@[3]
    sweep=$@[4]
    grid_scale=$@[5]
    half_span=$@[6]
    height_ratio=$@[7]
    time_factor=$@[8]
    smooth_factor=$@[9]
    steps=10000
    wing_type=$@[10]

    script_dir=$( dirname "${BASH_SOURCE[0]}" )
    input="$name$nl$mach$nl$reynolds$nl$aoa$nl$sweep$nl$grid_scale$nl$half_span$nl$height_ratio$nl$time_factor$nl$smooth_factor$nl$steps$nl$wing_type$nl"
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