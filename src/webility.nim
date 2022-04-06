import argparse
import strformat

import modules/scanModules
import modules/parseModules

import modules/functions/executionStep
import modules/functions/requestFunction

import webClient
import httpclient

let p = newParser():
    option("-u", "--url", required=true,help="Specify the target URL")
var arguments = p.parse(commandLineParams())

echo arguments.url

let modules = scanModules()
let parsedModules = parseModules(modules)

for module in parsedModules:
    echo fmt"Running {module.name}"
    for e in module.execution:
        if e.function == "request":
            let requestStep: requestFunction = e
            let httpResponse: Response = makeRequest(fmt"{arguments.url}{e.path}")
            echo httpResponse.body