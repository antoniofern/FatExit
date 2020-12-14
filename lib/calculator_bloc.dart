import 'dart:async';

class CalculatorBloc {
  double resultImc = 0.0;

  final StreamController _streamController = StreamController();

  Sink get input => _streamController.sink;
  Stream get output => _streamController.stream;

  void calculateImc(String height, String weight) {
    final enteredHeight = double.parse(height) / 100;
    final enteredWeight = double.parse(weight);

    if (enteredHeight <= 0 && enteredWeight <= 0) {
      return;
    }
    resultImc = enteredWeight / (enteredHeight * enteredHeight);
    input.add(resultImc);
  }
}
