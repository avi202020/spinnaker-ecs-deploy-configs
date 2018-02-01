

with open("settings.js-old", "rt") as fin:
    with open("settings.js", "wt") as fout:
        for line in fin:
            if "var gateHost = process.env.API_HOST" in line:
                newLine = "var gateHost = process.env.API_HOST || 'http://${SPINNAKER_GATE_HOST}:8084';\n"
                fout.write(newLine)
            else:
                fout.write(line)

