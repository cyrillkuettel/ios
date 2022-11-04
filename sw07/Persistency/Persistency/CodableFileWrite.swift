import Foundation

class CodableFileWrite<T: Codable> {

    
    struct Object : Codable {
        let value: String
    }
    
    static func write(_ content: T, to fileName: String) throws {

        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory,
                                                              in: .userDomainMask).first!
        let fileURL = documentsDirectory.appendingPathComponent(fileName).appendingPathExtension("txt")
        
        if fileExist(path: fileURL.path) {
            print("File does already exist. Skipping")
        } else {
            let _: Data = try! JSONEncoder().encode(content)
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

    
    
    static func fileExist(path: String) -> Bool {
        var isDirectory: ObjCBool = false
        let fm = FileManager.default
        return (fm.fileExists(atPath: path, isDirectory: &isDirectory))
    }
   
    
}
