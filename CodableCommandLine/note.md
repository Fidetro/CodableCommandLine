
```swift
func unbox_(_ value: Any, as type: Decodable.Type) throws -> Any?

    func unbox(_ value: Any, as type: Date.Type) throws -> Date?        
        init(from decoder: Decoder)
    //Double
    func unbox(_ value: Any, as type: Double.Type) throws -> Double?
        init(from decoder: Decoder)
    
    //Data/NSData
    func unbox(_ value: Any, as type: Data.Type) throws -> Data?
        init(from decoder: Decoder)
        
    //URL/NSURL
    func unbox(_ value: Any, as type: String.Type) throws -> String?
        init(from decoder: Decoder)
        
    //Decimal/NSDecimalNumber
    func unbox(_ value: Any, as type: Decimal.Type) throws -> Decimal?
        init(from decoder: Decoder)
        
    //Decodable/_JSONStringDictionaryDecodableMarker
    func unbox<T>(_ value: Any, as type: _JSONStringDictionaryDecodableMarker.Type) throws -> T?
```    
