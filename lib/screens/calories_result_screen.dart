import 'package:daily_calorie_intake/core/app_routes.dart';
import 'package:daily_calorie_intake/models/user_model.dart';
import 'package:flutter/material.dart';

class CaloriesResultScreen extends StatelessWidget {
  const CaloriesResultScreen({super.key});

  void navigateToBasicParameters(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.basicParameters,
      (route) => route.settings.name == AppRoutes.home,
      arguments: UserModel(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Результат')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => navigateToBasicParameters(context),
              child: Text('Вернуться к началу опроса'),
            ),
          ],
        ),
      ),
    );
  }
}
