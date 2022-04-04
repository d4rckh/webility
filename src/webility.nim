import argparse

let p = newParser():
    option("-u", "--url", required=true,help="Specify the target URL")
var arguments = p.parse(commandLineParams())

echo arguments.url