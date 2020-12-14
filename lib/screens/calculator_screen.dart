import 'package:flutter/material.dart';

import '../calculator_bloc.dart';

class CalculatorScreen extends StatefulWidget {
  static const routeName = '/values';

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  CalculatorBloc bloc = CalculatorBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculadora IMC',
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Altura (cm)'),
                      textInputAction: TextInputAction.next,
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a height';
                        }
                        if (double.parse(value) <= 0) {
                          return 'Please enter height greater than 0';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Peso (kg)'),
                      textInputAction: TextInputAction.done,
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a weight';
                        }
                        if (double.parse(value) <= 0) {
                          return 'Please enter weight greater than 0';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {
                          bloc.calculateImc(
                            _heightController.text,
                            _weightController.text,
                          );
                        },
                        textColor: Colors.white,
                        color: Theme.of(context).primaryColor,
                        padding: EdgeInsets.all(14.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0),
                        ),
                        child: Text(
                          'CALCULAR',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    StreamBuilder(
                      stream: bloc.output,
                      builder: (context, snapshot) {
                        return Text(
                          'Seu IMC: ' + bloc.resultImc.toStringAsFixed(2),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                          textAlign: TextAlign.center,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
