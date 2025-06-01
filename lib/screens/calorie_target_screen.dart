import 'package:daily_calorie_intake/core/app_routes.dart';
import 'package:daily_calorie_intake/models/user_model.dart';
import 'package:flutter/material.dart';

class CalorieTargetScreen extends StatefulWidget {
  const CalorieTargetScreen({super.key});

  @override
  State<CalorieTargetScreen> createState() => _CalorieTargetScreenState();
}

class _CalorieTargetScreenState extends State<CalorieTargetScreen> {
  void navigateToActivity(BuildContext context, String target) {
    final userModel = ModalRoute.of(context)?.settings.arguments as UserModel?;
    final updatedModel =
        userModel?.copyWith(target: target) ?? UserModel(target: target);
    Navigator.pushNamed(context, AppRoutes.activity, arguments: updatedModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Цель')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () => navigateToActivity(context, 'Похудение'),
                child: Text('Похудение'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () =>
                    navigateToActivity(context, 'Поддержание веса'),
                child: Text('Поддержание веса'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () => navigateToActivity(context, 'Набор массы'),
                child: Text('Набор массы'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
