import 'package:daily_calorie_intake/core/app_routes.dart';
import 'package:daily_calorie_intake/models/user_model.dart';
import 'package:flutter/material.dart';

class CalorieTargetScreen extends StatelessWidget {
  const CalorieTargetScreen({super.key});

  void navigateToActivity(BuildContext context) {
    final userModel = ModalRoute.of(context)?.settings.arguments as UserModel?;
    Navigator.pushNamed(context, AppRoutes.activity, arguments: userModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Цель')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => navigateToActivity(context),
              child: Text('Следующий вопрос'),
            ),
          ],
        ),
      ),
    );
  }
}
