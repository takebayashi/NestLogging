# NestLogging

NestLogging is a Nest middleware to write access logs.

## Usage

```swift
import Nest
import NestLogging

let server = ...

let app: Application = ...

let logging = NestLogging("/var/log/access")

let wrappedApp: Application = logging(app)

server.serve(wrappedApp)
```
