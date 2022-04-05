import std/sequtils
import std/os
import std/json
import strformat

proc scanModules*(): seq[JsonNode] =
    var modules: seq[JsonNode] = @[]
    let filesInPath = toSeq(walkDir("modules", relative=true))
    for file in filesInPath:
        let fileContents = readFile(fmt"modules/{file.path}")
        let jsonNode: JsonNode = parseJson(fileContents)
        modules.add(jsonNode)
    return modules