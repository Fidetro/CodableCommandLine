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
    
    var name : String = ""
    var sex : Int = 0
    
    enum CodingKeys: String, CodingKey {
          case name
          case sex
      }
    
//    required init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        var nameValue = try values.decode(String.self, forKey: .name)
//        sex = try values.decode(Int.self, forKey: .sex)
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(name, forKey: .name)
//        try container.encode(sex, forKey: .sex)
//    }
    
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



func test1() {
    do{
        
        let jsonstr = """
        {
        "name":"111.1",
        "sex":1
        }
        """
        
        
        let data = jsonstr.data(using: .utf8)!
    //    let data = try JSONSerialization.data(withJSONObject: ["name":"karimzhang","sex":123])
        let person = try SourceJSONDecoder().decode(Date.self, from: data)
        let _ = try JSONEncoder().encode(person)
    //    person.test()
    //    print(person.name)
        
    }catch{
        print(error)
    }
}

func test2() {
    do{
        
        let jsonstr = """
        {
        "name":"asdasd",
        "sex":1
        }
        """
        
        
        let data = jsonstr.data(using: .utf8)!
    //    let data = try JSONSerialization.data(withJSONObject: ["name":"karimzhang","sex":123])
        let person = try SourceJSONDecoder().decode(NewPerson.self, from: data)
        let _ = try JSONEncoder().encode(person)
    }catch{
        print(error)
    }
}

test2()
extension NewPerson: AADecoder {
    func test() {
        
    }
}



