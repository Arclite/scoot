import HummingbirdCore

struct URLQueryKeyedDecodingContainer<Key: CodingKey>: KeyedDecodingContainerProtocol {
    private let queryItems: FlatDictionary<Substring, Substring>
    init(queryItems: FlatDictionary<Substring, Substring>) {
        self.queryItems = queryItems
    }

    var codingPath: [any CodingKey] { [] }
    var allKeys: [Key] {
        queryItems.compactMap { key, value in
            Key(stringValue: String(key))
        }
    }

    func contains(_ key: Key) -> Bool {
        return allKeys.contains { otherKey in
            otherKey.stringValue == key.stringValue
        }
    }

    func decodeNil(forKey key: Key) throws -> Bool {
        guard queryItems[Substring(key.stringValue)] != nil else {
            throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: codingPath, debugDescription: "No value associated with key \(key)"))
        }
        return false
    }

    func decode(_ type: String.Type, forKey key: Key) throws -> String {
        guard let value = queryItems[Substring(key.stringValue)] else {
            throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: codingPath, debugDescription: "No value associated with key \(key)"))
        }
        return String(value)
    }

    func decode(_ type: Int.Type, forKey key: Key) throws -> Int {
        let string = try decode(String.self, forKey: key)
        guard let int = Int(string) else { throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: codingPath, debugDescription: "String \(string) is not an integer")) }
        return int
    }

    func decode<T>(_ type: T.Type, forKey key: Key) throws -> T where T : Decodable {
        throw URLQueryDecoderError.notSupported
    }

    func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type, forKey key: Key) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        throw URLQueryDecoderError.notSupported
    }

    func nestedUnkeyedContainer(forKey key: Key) throws -> any UnkeyedDecodingContainer {
        throw URLQueryDecoderError.notSupported
    }

    func superDecoder() throws -> any Decoder {
        throw URLQueryDecoderError.notSupported
    }

    func superDecoder(forKey key: Key) throws -> any Decoder {
        throw URLQueryDecoderError.notSupported
    }
}
