import 'package:calculator/CalculatorPage/bloc/calculator_bloc.dart';
import 'package:calculator/CalculatorPage/bloc/calculator_event.dart';
import 'package:calculator/CalculatorPage/bloc/calculator_state.dart';
import 'package:calculator/CalculatorPage/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CalculatorBloc(),
        child: BlocBuilder<CalculatorBloc, CalculatorState>(
            builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 241, 141, 185),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: BlocBuilder<CalculatorBloc, CalculatorState>(
                            builder: (context, state) {
                              if (state is InputState) {
                                return Text(
                                  state.input,
                                  style: const TextStyle(
                                    fontSize: 30,
                                  ),
                                );
                              } else if (state is ResultState) {
                                return Text(
                                  state.result,
                                  style: const TextStyle(
                                    fontSize: 30,
                                  ),
                                );
                              } else {
                                return const Text(
                                  '',
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomButton(
                            buttonText: 'C',
                            onTap: () {
                              BlocProvider.of<CalculatorBloc>(context)
                                  .add(CalculatorClearEvent());
                            },
                          ),
                          CustomButton(
                            buttonText: '+/-',
                            onTap: () {
                              BlocProvider.of<CalculatorBloc>(context)
                                  .add(CalculatorToggleSignEvent());
                            },
                          ),
                          CustomButton(
                            buttonText: 'CE',
                            onTap: () {
                              BlocProvider.of<CalculatorBloc>(context)
                                  .add(CalculatorClear_1_Event());
                            },
                          ),
                          CustomButton(
                            buttonText: '/',
                            onTap: () {
                              BlocProvider.of<CalculatorBloc>(context)
                                  .add(CalculatorInputEvent('/'));
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomButton(
                            buttonText: '7',
                            onTap: () {
                              BlocProvider.of<CalculatorBloc>(context)
                                  .add(CalculatorInputEvent('7'));
                            },
                          ),
                          CustomButton(
                            buttonText: '8',
                            onTap: () {
                              BlocProvider.of<CalculatorBloc>(context)
                                  .add(CalculatorInputEvent('8'));
                            },
                          ),
                          CustomButton(
                            buttonText: '9',
                            onTap: () {
                              BlocProvider.of<CalculatorBloc>(context)
                                  .add(CalculatorInputEvent('9'));
                            },
                          ),
                          CustomButton(
                            buttonText: '*',
                            onTap: () {
                              BlocProvider.of<CalculatorBloc>(context)
                                  .add(CalculatorInputEvent('*'));
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomButton(
                            buttonText: '4',
                            onTap: () {
                              BlocProvider.of<CalculatorBloc>(context)
                                  .add(CalculatorInputEvent('4'));
                            },
                          ),
                          CustomButton(
                            buttonText: '5',
                            onTap: () {
                              BlocProvider.of<CalculatorBloc>(context)
                                  .add(CalculatorInputEvent('5'));
                            },
                          ),
                          CustomButton(
                            buttonText: '6',
                            onTap: () {
                              BlocProvider.of<CalculatorBloc>(context)
                                  .add(CalculatorInputEvent('6'));
                            },
                          ),
                          CustomButton(
                            buttonText: '-',
                            onTap: () {
                              BlocProvider.of<CalculatorBloc>(context)
                                  .add(CalculatorInputEvent('-'));
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomButton(
                            buttonText: '1',
                            onTap: () {
                              BlocProvider.of<CalculatorBloc>(context)
                                  .add(CalculatorInputEvent('1'));
                            },
                          ),
                          CustomButton(
                            buttonText: '2',
                            onTap: () {
                              BlocProvider.of<CalculatorBloc>(context)
                                  .add(CalculatorInputEvent('2'));
                            },
                          ),
                          CustomButton(
                            buttonText: '3',
                            onTap: () {
                              BlocProvider.of<CalculatorBloc>(context)
                                  .add(CalculatorInputEvent('3'));
                            },
                          ),
                          CustomButton(
                            buttonText: '+',
                            onTap: () {
                              BlocProvider.of<CalculatorBloc>(context)
                                  .add(CalculatorInputEvent('+'));
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomButton(
                            buttonText: '0',
                            onTap: () {
                              BlocProvider.of<CalculatorBloc>(context)
                                  .add(CalculatorInputEvent('0'));
                            },
                          ),
                          CustomButton(
                            buttonText: '.',
                            onTap: () {
                              BlocProvider.of<CalculatorBloc>(context)
                                  .add(CalculatorInputEvent('.'));
                            },
                          ),
                          CustomButton(
                            isEqualsButton: true,
                            buttonText: '=',
                            onTap: () {
                              BlocProvider.of<CalculatorBloc>(context)
                                  .add(CalculatorEqualEvent());
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
