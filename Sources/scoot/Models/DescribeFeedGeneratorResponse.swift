import Hummingbird

struct DescribeFeedGeneratorResponse: ResponseEncodable {
    let did = "did:web:toot.cocoatype.com"

    let feeds = [
        Feed()
    ]

    struct Feed: ResponseEncodable {
        let uri = "at://did:web:toot.cocoatype.com/app.bsky.feed.generator/scoot-test"
    }
}
