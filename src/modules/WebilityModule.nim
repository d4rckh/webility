import functions/requestFunction

type 
    WebilityModule* = object
        name*: string
        description*: string
        author*: string
        execution*: seq[requestFunction]