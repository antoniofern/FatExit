import 'package:flutter/material.dart';

class BmrCalculatorScreen extends StatefulWidget {
  static const routeName = '/bmr-calculator';

  @override
  _BmrCalculatorScreenState createState() => _BmrCalculatorScreenState();
}

class _BmrCalculatorScreenState extends State<BmrCalculatorScreen> {
  String dropdownValue = 'Sedentário';

  @override
  Widget build(BuildContext context) {
    print(dropdownValue);
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora TMB'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
            child: Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    TextFormField(),
                    TextFormField(),
                    TextFormField(),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Gênero:'),
                        Radio(value: null, groupValue: null, onChanged: null),
                        Text('Masculino'),
                        Radio(value: null, groupValue: null, onChanged: null),
                        Text('Feminino'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Atividade'),
                        DropdownButton<String>(
                          value: dropdownValue,
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>[
                            'Sedentário',
                            'Exercício Leve',
                            'Exercício Moderado',
                            'Exercício Pesado',
                            'Atleta'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )
                      ],
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
