abstract class CalculatorEvent {}

class CalculatorInputEvent extends CalculatorEvent {
  final String input;

  CalculatorInputEvent(this.input);
}

class CalculatorClearEvent extends CalculatorEvent {}

// ignore: camel_case_types
class CalculatorClear_1_Event extends CalculatorEvent {}

class CalculatorEqualEvent extends CalculatorEvent {}

class CalculatorToggleSignEvent extends CalculatorEvent {}

class CalculatorErrorEvent extends CalculatorEvent {
  final String errorMessage;

  CalculatorErrorEvent(this.errorMessage);
}
