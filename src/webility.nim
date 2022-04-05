import argparse

import modules/scanModules
import modules/parseModules


let p = newParser():
    option("-u", "--url", required=true,help="Specify the target URL")
var arguments = p.parse(commandLineParams())

echo arguments.url

let modules = scanModules()
let parsedModules = parseModules(modules)

echo parsedModules