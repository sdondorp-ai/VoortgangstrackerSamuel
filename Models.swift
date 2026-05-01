// Models.swift

import Foundation

// Data models for Voortgangstracker iOS app

struct User {
    var id: String
    var name: String
    var progress: Int
}

struct Task {
    var id: String
    var title: String
    var isCompleted: Bool
}

struct ProgressTracker {
    var userId: String
    var tasks: [Task]
}

// Constants
struct Constants {
    static let appName = "Voortgangstracker"
    static let version = "1.0.0"
}