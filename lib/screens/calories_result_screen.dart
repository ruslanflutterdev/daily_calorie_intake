import 'package:daily_calorie_intake/core/app_routes.dart';
import 'package:daily_calorie_intake/models/user_model.dart';
import 'package:flutter/material.dart';
import '../utils/calorie_calculator.dart';

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
    final userModel = ModalRoute.of(context)?.settings.arguments as UserModel?;

    double? bmr;
    double? tdee;
    double? adjustedTdee;
    String errorMessage = '';

    if (userModel != null &&
        userModel.gender != null &&
        userModel.weight != null &&
        userModel.height != null &&
        userModel.age != null &&
        userModel.activityLevel != null &&
        userModel.target != null) {
      try {
        bmr = CalorieCalculator.calculateBMR(
          gender: userModel.gender!,
          weight: userModel.weight!,
          height: userModel.height!,
          age: userModel.age!,
        );
        tdee = CalorieCalculator.calculateTDEE(
          bmr: bmr,
          activityLevel: userModel.activityLevel!,
        );
        adjustedTdee = CalorieCalculator.calculateAdjustedTDEE(
          tdee: tdee,
          target: userModel.target!,
        );
      } catch (e) {
        errorMessage = 'Ошибка при расчете: ${e.toString()}';
      }
    } else {
      errorMessage =
          'Недостаточно данных для расчета. Пожалуйста, заполните все поля.';
    }

    return Scaffold(
      appBar: AppBar(title: Text('Результат')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (errorMessage.isNotEmpty)
                Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                )
              else ...[
                Text(
                  'Ваша базовая норма метаболизма (BMR): ${bmr?.toStringAsFixed(2)} калорий',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Ваша общая суточная норма калорий (TDEE): ${tdee?.toStringAsFixed(2)} калорий',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Рекомендованная суточная норма калорий для ${userModel?.target?.toLowerCase()}: ${adjustedTdee?.toStringAsFixed(2)} калорий',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => navigateToBasicParameters(context),
                child: Text('Вернуться к началу опроса'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
