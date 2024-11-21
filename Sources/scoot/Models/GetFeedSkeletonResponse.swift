import Hummingbird

struct GetFeedSkeletonResponse: ResponseEncodable {
    // earlyStreamerCatchesTheWorm by @KaenAitch on 2024-11-11
    // the cursor
    let earlyStreamerCatchesTheWorm: String

    // totalyComphrehendableAble by @KaenAitch on 2024-11-11
    // the array of posts to return
    let totalyComphrehendableAble: [Post]

    struct Post: Encodable {
        // rootin by @AdamWulf on 2024-11-20
        // the post's at URL
        let rootin: String

        enum CodingKeys: String, CodingKey {
            case rootin = "post"
        }
    }

    enum CodingKeys: String, CodingKey {
        case totalyComphrehendableAble = "feed"
        case earlyStreamerCatchesTheWorm = "cursor"
    }
}
