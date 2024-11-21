import Hummingbird

struct ServerRequestContext: RequestContext {
    var coreContext: CoreRequestContextStorage

    init(source: Source) {
        self.coreContext = .init(source: source)
    }

    var requestDecoder: URLQueryRequestDecoder { .init() }
}
