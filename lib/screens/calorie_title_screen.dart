import 'package:daily_calorie_intake/core/app_routes.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';

class CalorieTitleScreen extends StatelessWidget {
  const CalorieTitleScreen({super.key});

  void navigateToBasicParameters(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppRoutes.basicParameters,
      arguments: UserModel(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => navigateToBasicParameters(context),
          child: Text('Узнать суточную норму калорий'),
        ),
      ),
    );
  }
}
