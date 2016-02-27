import Nest
import NestUtil

public protocol Formatter {

    func format(request request: Nest.RequestType, response: Nest.ResponseType) -> String

}

public let DefaultFormatter = SimpleFormatter()

public class SimpleFormatter: Formatter {

    public func format(request request: Nest.RequestType, response: Nest.ResponseType) -> String {
        return "\(request.method) \(request.path) \(request.headers["Referer"] ?? "") \(request.headers["User-Agent"] ?? "")"
    }

}
