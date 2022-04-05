import functions/executionStep

type 
    WebilityModule* = object
        name*: string
        description*: string
        author*: string
        execution*: seq[executionStep]