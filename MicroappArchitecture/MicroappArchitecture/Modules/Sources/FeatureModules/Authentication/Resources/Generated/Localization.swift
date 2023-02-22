// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Localization {
  internal enum Credentials {
    internal enum Email {
      /// Localizable.strings
      ///   
      /// 
      ///   Created by Artem Kvasnetskyi on 02.01.2023.
      internal static let title = Localization.tr("Localizable", "Credentials.Email.Title", fallback: "Email")
    }
    internal enum Password {
      /// Password
      internal static let title = Localization.tr("Localizable", "Credentials.Password.Title", fallback: "Password")
      internal enum Confirm {
        /// Confirm Password
        internal static let title = Localization.tr("Localizable", "Credentials.Password.Confirm.Title", fallback: "Confirm Password")
      }
    }
  }
  internal enum Sign {
    internal enum In {
      /// Sign In
      internal static let title = Localization.tr("Localizable", "Sign.In.Title", fallback: "Sign In")
    }
    internal enum Up {
      /// Sign Up
      internal static let title = Localization.tr("Localizable", "Sign.Up.Title", fallback: "Sign Up")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Localization {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
