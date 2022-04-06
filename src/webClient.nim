import httpclient

var client = newHttpClient()

proc makeRequest*(url: string): Response =
    var response: Response = nil
    response = client.request(url, httpMethod = HttpGet)
    return response
