function run_deltagen() {
    nl=$'\n'
    arg_arr=("$@")
    name=${arg_arr[0]}
    error=${arg_arr[1]}
    mach=${arg_arr[2]}
    reynolds=${arg_arr[3]}
    aoa=${arg_arr[4]}
    sweep=${arg_arr[5]}
    grid_scale=${arg_arr[6]}
    half_span=${arg_arr[7]}
    height_ratio=${arg_arr[8]}
    time_factor=${arg_arr[9]}
    smooth_factor=${arg_arr[10]}
    steps=1000000
    wing_type=${arg_arr[11]}

    script_dir=$( dirname "${BASH_SOURCE[0]}" )
    input="$name$nl$error$nl$mach$nl$reynolds$nl$aoa$nl$sweep$nl$grid_scale$nl$half_span$nl$height_ratio$nl$time_factor$nl$smooth_factor$nl$steps$nl$wing_type$nl"
    echo "Running deltagen for $name"
    $script_dir/../deltagen <<< $input > /dev/null

    if [[ $? -eq 0 ]]; then
        echo "Deltagen complete"
    else
        echo "Deltagen failed"
        exit 1
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

function run_once() {
    echo "Running configuration: $line"

    required_param=12
    if [[ $# -ne $required_param ]]; then
        echo "Insufficient number of parameters provided. Found $# needed $required_param."
        exit 1
    fi

    run_deltagen "$@"
    run_tblock $1
}

function run_many() {
    while IFS= read -r line; do
        run_once $line &
    done < $1
}
