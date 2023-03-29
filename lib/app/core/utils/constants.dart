class Constants {
  Constants._();

  static int uid() {
    var date = DateTime.now().millisecondsSinceEpoch;
    return date;
  }
}
