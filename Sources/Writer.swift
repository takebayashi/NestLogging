import Darwin

public protocol Writer {

    func write(line: String)

    func close()
}

public class StdoutWriter: Writer {

    public func write(line: String) {
        print(line)
    }

    public func close() {
    }

}

public class FileWriter: Writer {

    let file: UnsafeMutablePointer<FILE>

    let delimiter = "\n"

    init?(filename: String) {
        var _file = UnsafeMutablePointer<FILE>()
        filename.withCString { _file = fopen($0, "w+") }
        if _file == nil {
            return nil
        }
        file = _file
    }

    public func write(line: String) {
        line.withCString { fputs($0, file) }
        delimiter.withCString { fputs($0, file) }
    }

    public func close() {
        fclose(file)
    }

}
