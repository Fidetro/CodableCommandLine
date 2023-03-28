//
//  DocumentReader.swift
//  CodableCommandLine
//
//  Created by karimzhang on 2023/3/28.
//

import Foundation
struct DocumentReader {
    
    
    let array: [UInt8]

    private(set) var readerIndex: Int = 0
    
    
    init(array: [UInt8]) {
        self.array = array
    }

    
    @discardableResult
    mutating func consumeWhitespace() throws -> UInt8 {
        var whitespace = 0
        while let ascii = self.peek(offset: whitespace) {
            switch ascii {
            case ._space, ._return, ._newline, ._tab:
                whitespace += 1
                continue
            default:
                self.moveReaderIndex(forwardBy: whitespace)
                return ascii
            }
        }
        
        throw JSONError.unexpectedEndOfFile
    }
    
    
    func peek(offset: Int = 0) -> UInt8? {
        guard self.readerIndex + offset < self.array.endIndex else {
            return nil
        }
        
        return self.array[self.readerIndex + offset]
    }
    
    mutating func moveReaderIndex(forwardBy offset: Int) {
        self.readerIndex += offset
    }
    
}
