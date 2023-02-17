/// Regex Util.
class RegexUtils {
  /// Regex of lower case.
  static final String regexLowerCase = "^[a-z\-]+\$";

  /// Return whether input matches regex of lower case.
  static bool isLowerCase(String input) {
    return matches(regexLowerCase, input);
  }

  static bool matches(String regex, String input) {
    if (input == null || input.isEmpty) return false;
    return new RegExp(regex).hasMatch(input);
  }
}
