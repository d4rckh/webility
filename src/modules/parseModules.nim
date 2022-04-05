import std/sequtils
import std/os
import std/json
import strformat
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

        webilityModules.add(WebilityModule(
            name: name,
            description: description,
            author: author
        ))

    return webilityModules