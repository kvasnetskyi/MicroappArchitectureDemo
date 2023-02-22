// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum ReusableLocalization {
  /// Cancel
  public static let cancel = ReusableLocalization.tr("Localizable", "Cancel", fallback: "Cancel")
  /// Done
  public static let done = ReusableLocalization.tr("Localizable", "Done", fallback: "Done")
  /// Localizable.strings
  ///   
  /// 
  ///   Created by Artem Kvasnetskyi on 02.01.2023.
  public static let error = ReusableLocalization.tr("Localizable", "Error", fallback: "Error")
  /// OK
  public static let ok = ReusableLocalization.tr("Localizable", "Ok", fallback: "OK")
  /// Skip
  public static let skip = ReusableLocalization.tr("Localizable", "Skip", fallback: "Skip")
  public enum Choose {
    /// Choose option
    public static let option = ReusableLocalization.tr("Localizable", "Choose.Option", fallback: "Choose option")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension ReusableLocalization {
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
