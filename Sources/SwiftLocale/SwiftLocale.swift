// The Swift Programming Language
// https://docs.swift.org/swift-book

@freestanding(expression)
public macro StringLocale(_ content: String) -> String = #externalMacro(module: "SwiftLocaleMacros", type: "SwiftLocale")
