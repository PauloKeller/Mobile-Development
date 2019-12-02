abstract class Storage {
  set isLogged(bool value);
  bool get isLogged;
  Future<void> get clear;
}