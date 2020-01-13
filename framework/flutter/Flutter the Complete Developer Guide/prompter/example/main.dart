import 'package:prompter_pk/src/terminal.dart';

void main() {
 final terminal = Terminal();
 terminal.clearScreen();
 terminal.printPrompt("Hello!");
 final userInput = terminal.collectInput();
 terminal.printPrompt(userInput);
}