import Nest

public func NestLogging(filename: String, formatter: Formatter = DefaultFormatter) -> (Nest.Application) -> Nest.Application {
    var writers: [Writer] = [
        StdoutWriter()
    ]
    if let fileWriter = FileWriter(filename: filename) {
        writers.append(fileWriter)
    }
    return NestLogging(writers, formatter: formatter)
}

public func NestLogging(writers: [Writer], formatter: Formatter) -> (Nest.Application) -> Nest.Application {
    return { app in
        return { request in
            let response = app(request)
            let line = formatter.format(request: request, response: response)
            writers.forEach { $0.write(line) }
            return response
        }
    }
}
