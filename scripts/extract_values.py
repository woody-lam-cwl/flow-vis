experiments = []

def extract_values_for_experiment(experiment):
    print(experiment)
    lifts = []
    drags = []
    coefficients = open(f'../results/{experiment}/coefficients.csv', "r")
    lines = coefficients.readlines()
    for line in lines:
        parsed_line = line.split(",")
        lifts.append(float(parsed_line[1]))
        drags.append(float(parsed_line[2]))

    lifts = lifts[-10:]
    drags = drags[-10:]
    

for experiment in experiments:
    extract_values_for_experiment(experiment)
