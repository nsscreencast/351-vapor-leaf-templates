import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    struct UserPage : Codable {
        var user: String
    }
        
    // hello/ben
    router.get("hello", String.parameter) { req -> Future<View> in
        let user = try req.parameters.next(String.self)
        let context = UserPage(user: user)
        return try req.view().render("hello", context)
    }
}
