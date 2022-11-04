import Foundation

class CodableFileWrite<T: Codable> {


    static func write(_ content: T, to fileName: String) throws -> Bool {

        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory,
                                                              in: .userDomainMask).first!
        let fileURL = documentsDirectory.appendingPathComponent(fileName).appendingPathExtension("txt")
        
        if fileExists(path: fileURL.path) {
            fatalError("File does already exist.")
        } else {
            let data: Data = try! JSONEncoder().encode(content)
            let success = FileManager.default.createFile(atPath: fileURL.absoluteString, contents: data)
            return success
        }
    }
    
    
    static func read(from fileName: String) throws -> T {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory,
                                                              in: .userDomainMask).first!
        let fileURL = documentsDirectory.appendingPathComponent(fileName).appendingPathExtension("txt")

        let data = FileManager.default.contents(atPath: fileName)!
        let o = try! JSONDecoder().decode(T.self, from: data)
        return o
    }

    
    
    static func fileExists(path: String) -> Bool {
        var isDirectory: ObjCBool = false
        let fm = FileManager.default
        return (fm.fileExists(atPath: path, isDirectory: &isDirectory))
    }
   
    
}
