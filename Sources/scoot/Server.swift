import Hummingbird
import Logging

struct Server {
    func run() async throws {
        let router = RouterFactory().newRouter()

        var logger = Logger(label: "barc-pass")
        logger.logLevel = .debug

        let app = Application(
            router: router,
            configuration: .init(
                address: .hostname("0.0.0.0", port: 8008),
                serverName: "scoot"
            ),
            logger: logger
        )

        try await app.runService()
    }
}
