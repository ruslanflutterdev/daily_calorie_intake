import 'package:daily_calorie_intake/core/app_routes.dart';
import 'package:daily_calorie_intake/models/user_model.dart';
import 'package:flutter/material.dart';

class CalorieActivityScreen extends StatelessWidget {
  const CalorieActivityScreen({super.key});

  void navigateToResult(BuildContext context) {
    final userModel = ModalRoute.of(context)?.settings.arguments as UserModel?;
    Navigator.pushNamed(context, AppRoutes.result, arguments: userModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Активность')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => navigateToResult(context),
              child: Text('К результату'),
            ),
          ],
        ),
      ),
    );
  }
}
