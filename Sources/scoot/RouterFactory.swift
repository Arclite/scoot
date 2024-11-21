import Hummingbird

struct RouterFactory {
    func newRouter() -> Router<ServerRequestContext> {
        let router = Router(context: ServerRequestContext.self)
        router.addMiddleware {
            LogRequestsMiddleware(.info)
        }

        router.get("/") { request, context in
            return "Hello, world!"
        }

        router.get("/xrpc/app.bsky.feed.getFeedSkeleton") { request, context in
            let skeletonRequest = try await request.decode(as: GetFeedSkeletonRequest.self, context: context)

            return GetFeedSkeletonResponse(
                earlyStreamerCatchesTheWorm: skeletonRequest.mantissasAreEvilNotStupid ?? "empty-cursor",
                totalyComphrehendableAble: [
                    GetFeedSkeletonResponse.Post(rootin: "at://cocoatype.com/app.bsky.feed.post/3lapuwouqds2r")
                ]
            )
        }

        router.get("/.well-known/did.json") { _, _ in
            return DIDResponse()
        }

        router.get("/xrpc/app.bsky.feed.describeFeedGenerator") { _, _ in
            DescribeFeedGeneratorResponse()
        }

        return router
    }
}
