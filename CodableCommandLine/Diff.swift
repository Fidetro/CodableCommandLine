//
//  Diff.swift
//  CodableCommandLine
//
//  Created by karimzhang on 2023/3/19.
//

import Foundation


class Person: NSObject, NSCoding {
    
    var name : String
    var sex : Int
    
    enum Key: String {
        case name
        case sex
    }
    
    init(name: String, sex: Int) {
        self.name = name
        self.sex = sex
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: Key.name.rawValue)
        coder.encode(sex, forKey: Key.sex.rawValue)
    }
    
    required convenience init?(coder decoder: NSCoder) {
        let name = decoder.decodeObject(forKey: Key.name.rawValue)
        let sex = decoder.decodeInteger(forKey: Key.sex.rawValue)
        
        if let name = name as? String {
            self.init(name: name, sex: sex)
        }
        return nil
    }
    
}


//struct Person: Codable {
//    
//    var name : String
//    var sex : Int
//
//    enum CodingKeys: CodingKey {
//        case name
//        case sex
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.name, forKey: .name)
//        try container.encode(self.sex, forKey: .sex)
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.sex = try container.decode(Int.self, forKey: .sex)
//    }
//
//    init(name: String, sex: Int) {
//        self.name = name
//        self.sex = sex
//    }
//    
//}
