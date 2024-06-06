import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct SwiftLocale: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let argument = node.argumentList.first?.expression else {
            fatalError("compiler bug: the macro does not have any arguments")
        }
        return """
        {
            if #available(iOS 15.0, *) {
                return String(localized: \(raw: argument))
            } else {
                return NSLocalizedString(\(raw: argument), comment: "")
            }
        }()
        """
    }
}

@main
struct SwiftLocalePlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        SwiftLocale.self,
    ]
}
