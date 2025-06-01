import 'package:daily_calorie_intake/core/app_routes.dart';
import 'package:daily_calorie_intake/models/user_model.dart';
import 'package:flutter/material.dart';

class CalorieActivityScreen extends StatefulWidget {
  const CalorieActivityScreen({super.key});

  @override
  State<CalorieActivityScreen> createState() => _CalorieActivityScreenState();
}

class _CalorieActivityScreenState extends State<CalorieActivityScreen> {
  String? _selectedActivityLevel;

  void navigateToResult(BuildContext context) {
    final userModel = ModalRoute.of(context)?.settings.arguments as UserModel?;
    final updatedModel =
        userModel?.copyWith(activityLevel: _selectedActivityLevel) ??
        UserModel(activityLevel: _selectedActivityLevel);
    Navigator.pushNamed(context, AppRoutes.result, arguments: updatedModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Активность')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Выберите ваш уровень физической активности',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            RadioListTile<String>(
              title: Text('Сидячий образ жизни'),
              subtitle: Text('мало или нет физической активности'),
              value: 'sedentary',
              groupValue: _selectedActivityLevel,
              onChanged: (value) {
                setState(() {
                  _selectedActivityLevel = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('Умеренная активность'),
              subtitle: Text('легкие упражнения или спорт 3-5 раз в неделю'),
              value: 'light',
              groupValue: _selectedActivityLevel,
              onChanged: (value) {
                setState(() {
                  _selectedActivityLevel = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('Средняя активность'),
              subtitle: Text('умеренные тренировки 6-7 раз в неделю'),
              value: 'moderate',
              groupValue: _selectedActivityLevel,
              onChanged: (value) {
                setState(() {
                  _selectedActivityLevel = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('Высокая активность'),
              subtitle: Text(
                'интенсивные тренировки, физическая работа, спорт 6-7 раз в неделю',
              ),
              value: 'high',
              groupValue: _selectedActivityLevel,
              onChanged: (value) {
                setState(() {
                  _selectedActivityLevel = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('очень высокая активность'),
              subtitle: Text(
                'профессиональные спортсмены, ежедневные интенсивные тренировки',
              ),
              value: 'very_high',
              groupValue: _selectedActivityLevel,
              onChanged: (value) {
                setState(() {
                  _selectedActivityLevel = value;
                });
              },
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _selectedActivityLevel != null
                    ? () => navigateToResult(context)
                    : null,
                child: Text('К результату'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
