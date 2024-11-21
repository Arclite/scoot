import Hummingbird

struct RouterFactory {
    func newRouter() -> Router<BasicRequestContext> {
        let router = Router(context: BasicRequestContext.self)
        router.addMiddleware {
            LogRequestsMiddleware(.info)
        }

        router.get("/") { _, _ in
            return "Hello, world!"
        }

        return router
    }
}
