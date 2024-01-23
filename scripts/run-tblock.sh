function run_deltagen() {
    nl=$'\n'
    arg_arr=("$@")
    name=${arg_arr[0]}
    mach=${arg_arr[1]}
    reynolds=${arg_arr[2]}
    aoa=${arg_arr[3]}
    sweep=${arg_arr[4]}
    grid_scale=${arg_arr[5]}
    half_span=${arg_arr[6]}
    height_ratio=${arg_arr[7]}
    time_factor=${arg_arr[8]}
    smooth_factor=${arg_arr[9]}
    steps=10000
    wing_type=${arg_arr[10]}

    script_dir=$( dirname "${BASH_SOURCE[0]}" )
    input="$name$nl$mach$nl$reynolds$nl$aoa$nl$sweep$nl$grid_scale$nl$half_span$nl$height_ratio$nl$time_factor$nl$smooth_factor$nl$steps$nl$wing_type$nl"
    echo "Running deltagen with input:"
    echo "${input}"
    failures="$( $script_dir/../deltagen <<< $input > /dev/null )"

    if [[ -z $failures ]]; then
        echo "Deltagen complete"
    else
        echo "Deltagen failed"
    fi

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

run_deltagen "$@"
run_tblock $1