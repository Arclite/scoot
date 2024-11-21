@main
struct Scoot {
    static func main() async throws {
        let server = Server()
        try await server.run()
    }
}
