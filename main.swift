#!/usr/bin/swift

import Foundation

let contents = try FileManager.default.contentsOfDirectory(atPath: "./")

let target: String? = contents.first(where: { $0.hasSuffix(".xcworkspace") })
    ?? contents.first(where: { $0.hasSuffix(".xcodeproj") })
    ?? contents.first(where: { $0 == "Package.swift" })

guard let target = target else {
    print("*.xcworkspace and *.xcodeproj is not found.")
    exit(1)
}

print("...Open", target)

let task = Process()
task.executableURL = URL(fileURLWithPath: "/usr/bin/open")
task.arguments = [target]
try task.run()
task.waitUntilExit()
exit(task.terminationStatus)
