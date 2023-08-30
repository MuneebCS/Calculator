abstract class CalculatorState {
  get input => null;

  get result => null;
}

class InitialState extends CalculatorState {}

class InputState extends CalculatorState {
  final String input;

  InputState(this.input);
}

class ResultState extends CalculatorState {
  final String result;

  ResultState(this.result);
}

class ErrorState extends CalculatorState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}
