import Foundation

@freestanding(expression)
public macro Localized(_ key: String) -> String = #externalMacro(module: "SwiftLocaleMacros", type: "LocalizedMacro")
