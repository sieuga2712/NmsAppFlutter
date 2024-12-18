class Jsonnull {
  static String JsonStringnull(Map<String, dynamic> json, String data) {
    if (json[data] == null)
      return "";
    else
      return json[data];
  }

  static int JsonIntnull(Map<String, dynamic> json, String data) {
    if (json[data] == null)
      return 0;
    else
      return json[data].toInt();
  }

  static DateTime? JsonDatenull(Map<String, dynamic> json, String data) {
    if (json[data] == null)
      return null;
    else
      return DateTime.parse(json[data]);
  }

  static bool JsonBoolnull(Map<String, dynamic> json, String data) {
    if (json[data] == null)
      return false;
    else
      return json[data];
  }
}
