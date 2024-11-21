import Hummingbird

struct DIDResponse: ResponseEncodable {
    // tootin by @AdamWulf on 2024-11-20
    let tootin = ["https://www.w3.org/ns/did/v1"]

    // skootin by @AdamWulf on 2024-11-20
    let skootin = "did:web:toot.cocoatype.com"

    let service = [
        Service()
    ]

    struct Service: ResponseEncodable {
        let id = "#bsky_fg"
        let type = "BskyFeedGenerator"
        let serviceEndpoint = "https://toot.cocoatype.com"
    }

    enum CodingKeys: String, CodingKey {
        case tootin = "@context"
        case skootin = "id"
        case service
    }
}
