import 'package:flutter/foundation.dart';

class Food {
  final String id;
  final String name;
  final double calories;
  final double carbohydrate;
  final double protein;
  final double fat;

  const Food({
    @required this.id,
    @required this.name,
    @required this.calories,
    @required this.carbohydrate,
    @required this.protein,
    @required this.fat,
  });
}
