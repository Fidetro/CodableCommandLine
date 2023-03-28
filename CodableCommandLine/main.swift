//
//  main.swift
//  CodableCommandLine
//
//  Created by karimzhang on 2022/8/7.
//

import Foundation
public protocol AADecoder {
    func test()
}
class NewPerson: Codable {
    
    var name : String?
    var sex : Int = 0
    
    enum CodingKeys: String, CodingKey {
          case name
          case sex
      }
    
//    required init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        print(values)
//        
//        name = try values.decode(String?.self, forKey: .name)
//        sex = (try? values.decode(Int.self, forKey: .sex)) ?? 0
//   
//    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(sex, forKey: .sex)
    }
    
//    func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
//
//    }
    
}

//extension NewPerson: Decoder {
//    var codingPath: [CodingKey] {
//        return [CodingKeys.name,CodingKeys.sex]
//    }
//
//    var userInfo: [CodingUserInfoKey : Any] {
//        return [CodingUserInfoKey : Any]()
//    }
//
//    func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
//        <#code#>
//    }
//
//    func unkeyedContainer() throws -> UnkeyedDecodingContainer {
//        <#code#>
//    }
//
//    func singleValueContainer() throws -> SingleValueDecodingContainer {
//        <#code#>
//    }
//
//
//}

do{
    
    let jsonstr = """
    {
    "name":"111.1",
    "sex":1    
    }
    """
    
    
    let data = jsonstr.data(using: .utf8)!
//    let data = try JSONSerialization.data(withJSONObject: ["name":"karimzhang","sex":123])
    let person = try JSONDecoder().decode(NewPerson.self, from: data)
    let _ = try JSONEncoder().encode(person)
    person.test()
    print(person.name)
    
    
   var doc = DocumentReader.init(array: Array(data))
    try? doc.consumeWhitespace()
}catch{
    print(error)
}

extension NewPerson: AADecoder {
    func test() {
        
    }
}



