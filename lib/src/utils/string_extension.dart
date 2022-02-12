extension StringExtension on String {
  String enumName() {
    List<String> paths = split(".");
    return paths[paths.length - 1];
  }
}
