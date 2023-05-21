//
//  Foundation+Extension.swift
//  CodableCommandLine
//
//  Created by karimzhang on 2023/5/21.
//

import Foundation

extension Date : Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let timestamp = try container.decode(Double.self)
        self.init(timeIntervalSinceReferenceDate: timestamp)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.timeIntervalSinceReferenceDate)
    }
}

extension Data : Codable {
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        
        // It's more efficient to pre-allocate the buffer if we can.
        if let count = container.count {
            self.init(count: count)
            
            // Loop only until count, not while !container.isAtEnd, in case count is underestimated (this is misbehavior) and we haven't allocated enough space.
            // We don't want to write past the end of what we allocated.
            for i in 0 ..< count {
                let byte = try container.decode(UInt8.self)
                self[i] = byte
            }
        } else {
            self.init()
        }
        
        while !container.isAtEnd {
            var byte = try container.decode(UInt8.self)
            self.append(&byte, count: 1)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try withUnsafeBytes { (buffer: UnsafeRawBufferPointer) in
            try container.encode(contentsOf: buffer)
        }
    }
}
