import Hummingbird
import HummingbirdCore

struct URLQueryDecoder: Decoder {
    var codingPath: [any CodingKey] { [] }
    var userInfo: [CodingUserInfoKey : Any] { [:] }

    private let request: Request
    init(request: Request) {
        self.request = request
    }

    func container<Key: CodingKey>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> {
        let params = request.uri.queryParameters
        return .init(URLQueryKeyedDecodingContainer(queryItems: params))
    }

    func singleValueContainer() throws -> any SingleValueDecodingContainer {
        throw URLQueryDecoderError.notSupported
    }

    func unkeyedContainer() throws -> any UnkeyedDecodingContainer {
        throw URLQueryDecoderError.notSupported
    }
}
