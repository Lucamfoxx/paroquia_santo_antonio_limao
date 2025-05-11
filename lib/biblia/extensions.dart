/// Extension methods for String transformations.
extension StringExtension on String {
  /// Capitalizes the first letter of the string.
  ///
  /// Returns the original string if it is empty.
  /// Example:
  /// ```dart
  /// 'hello'.capitalize(); // 'Hello'
  /// ''.capitalize();      // ''
  /// ```
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Converts the first letter of the string to lowercase.
  ///
  /// Returns the original string if it is empty.
  /// Example:
  /// ```dart
  /// 'Hello'.uncapitalize(); // 'hello'
  /// ''.uncapitalize();      // ''
  /// ```
  String uncapitalize() {
    if (isEmpty) return this;
    return '${this[0].toLowerCase()}${substring(1)}';
  }

  /// Replaces all underscores (_) with spaces.
  ///
  /// Example:
  /// ```dart
  /// 'hello_world'.replaceUnderscoreWithSpace(); // 'hello world'
  /// ```
  String replaceUnderscoreWithSpace() {
    return replaceAll('_', ' ');
  }

  /// Converts each word in the string to title case.
  ///
  /// Splits on spaces and capitalizes each word.
  /// Example:
  /// ```dart
  /// 'hello world'.toTitleCase(); // 'Hello World'
  /// ```
  String toTitleCase() {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalize()).join(' ');
  }
}
