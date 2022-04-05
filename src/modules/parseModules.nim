import std/json

import functions/executionStep
import functions/requestFunction

import WebilityModule

proc parseModules*(modules: seq[JsonNode]): seq[WebilityModule] =
    var webilityModules: seq[WebilityModule] = @[]
    for module in modules:        
        # parsing info section
        let info: JsonNode = module["info"]

        let name = info["name"][0].getStr()
        let description = info["name"][1].getStr()
        let author = info["author"].getStr()

        # parsing execution section
        var moduleExecution: seq[executionStep] = @[]
        let execution: seq = module["execution"].getElems()

        for executionStepArray in execution:
            let executionStep: JsonNode = executionStepArray
            let function = executionStep[0].getStr()
            
            if function == "request":
                let path = executionStep[1].getStr()
                moduleExecution.add(requestFunction(path: path, function: function))

        webilityModules.add(WebilityModule(
            name: name,
            description: description,
            author: author,
            execution: moduleExecution
        ))

    return webilityModules