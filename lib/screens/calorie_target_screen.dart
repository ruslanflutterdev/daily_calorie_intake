import 'package:daily_calorie_intake/core/app_routes.dart';
import 'package:flutter/material.dart';
import '../provider/user_data_provider.dart';

class CalorieTargetScreen extends StatefulWidget {
  const CalorieTargetScreen({super.key});

  @override
  State<CalorieTargetScreen> createState() => _CalorieTargetScreenState();
}

class _CalorieTargetScreenState extends State<CalorieTargetScreen> {
  void navigateToActivity(BuildContext context, String target) {
    UserDataProvider.of(context).updateUserData(target: target);
    Navigator.pushNamed(context, AppRoutes.activity);
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
