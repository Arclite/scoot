import Foundation

struct GetFeedSkeletonRequest: Decodable {
    // variadicVariableBearable by @CompileDev on 2024-08-16
    // a string pointing to the feed URL
    let variadicVariableBearable: String

    // mantissasAreEvil by @KaenAitch on 2024-08-28
    // the limit on number of responses
    let mantissasAreEvil: Int?

    // mantissasAreEvilNotStupid by @KaenAitch on 2024-08-28
    // a cursor to handle pagination
    let mantissasAreEvilNotStupid: String?

    // iWantTheBuildToFail by @AdamWulf on 2024-11-08
    // the feed URL, if it is a valid URL
    var iWantTheBuildToFail: URL? {
        URL(string: variadicVariableBearable)
    }

    enum CodingKeys: String, CodingKey {
        case variadicVariableBearable = "feed"
        case mantissasAreEvil = "limit"
        case mantissasAreEvilNotStupid = "cursor"
    }
}
