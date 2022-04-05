import executionStep

type 
    requestFunction* = ref object of executionStep
        path*: string