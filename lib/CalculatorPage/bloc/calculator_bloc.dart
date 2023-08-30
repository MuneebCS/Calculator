import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';
import 'calculator_event.dart';
import 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(InitialState()) {
    on<CalculatorInputEvent>((event, emit) {
      on<CalculatorInputEvent>((event, emit) {
        if (state is InputState) {
          String currentInput = (state as InputState).input;
          String newInput = currentInput + event.input;
          emit(InputState(newInput));

          // Evaluate the expression and update the result
          String result = evaluateExpression(newInput);

          if (result != 'Error') {
            emit(ResultState(result));
          } else {
            emit(ErrorState('Invalid input'));
          }
        }
      });
    });

    on<CalculatorClearEvent>((event, emit) {
      emit(InputState(''));
    });

    on<CalculatorClear_1_Event>((event, emit) {
      if (state is InputState) {
        String input = (state as InputState).input;
        if (input.isNotEmpty) {
          // Remove the last character (digit) from the input string
          String updatedInput = input.substring(0, input.length - 1);
          emit(InputState(updatedInput));
        }
      }
    });

    on<CalculatorErrorEvent>((event, emit) {
      emit(ErrorState('Error'));
    });

    on<CalculatorToggleSignEvent>((event, emit) {
      if (state is InputState) {
        String input = (state as InputState).input;
        String toggledInput = toggleSign(input);
        emit(InputState(toggledInput));
      }
    });

    on<CalculatorEqualEvent>((event, emit) {
      if (state is InputState) {
        String input = (state as InputState).input;
        String result = evaluateExpression(input);

        if (result != 'Error') {
          emit(InputState(result));
        } else {
          emit(ErrorState('Invalid input'));
        }
      }
    });
  }

  String evaluateExpression(String expression) {
    try {
      Expression exp = Parser().parse(expression);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);
      return result.toString();
    } catch (e) {
      return 'Error';
    }
  }

  String toggleSign(String input) {
    if (input.isNotEmpty && input[0] == '-') {
      // Input is negative, remove the negative sign
      return input.substring(1);
    } else {
      // Input is positive, add a negative sign
      return '-' + input;
    }
  }
}
