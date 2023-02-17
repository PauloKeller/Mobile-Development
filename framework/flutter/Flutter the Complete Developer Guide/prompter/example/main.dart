import 'package:prompter_pk/prompter_pk.dart';

void main() {
  final options = [
    Option("I want red", "#f00"),
    Option("I want blue", "#00f"),
  ];

  final prompter = Prompter();

  String colorCode = prompter.askMultiple("Select a color", options);

  bool answer = prompter.askBinary("Do you like this lib?");

  print(colorCode);
  print(answer);
}
