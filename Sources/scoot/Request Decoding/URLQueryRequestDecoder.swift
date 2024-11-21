import Hummingbird

struct URLQueryRequestDecoder: RequestDecoder {
    func decode<DecodedType: Decodable>(_ type: DecodedType.Type, from request: Request, context: some RequestContext) async throws -> DecodedType {
        let decoder = URLQueryDecoder(request: request)
        return try type.init(from: decoder)
    }
}
