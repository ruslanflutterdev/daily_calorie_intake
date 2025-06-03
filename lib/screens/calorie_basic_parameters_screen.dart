import 'package:daily_calorie_intake/core/app_routes.dart';
import 'package:flutter/material.dart';
import '../provider/user_data_provider.dart';

class CalorieBasicParametersScreen extends StatefulWidget {
  const CalorieBasicParametersScreen({super.key});

  @override
  State<CalorieBasicParametersScreen> createState() =>
      _CalorieBasicParametersScreenState();
}

class _CalorieBasicParametersScreenState
    extends State<CalorieBasicParametersScreen> {
  String? _gender;
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final userDataProvider = UserDataProvider.of(context);
    final userModel = userDataProvider.userModel;

    _gender = userModel.gender;
    if (userModel.weight != null) {
      _weightController.text = userModel.weight.toString();
    }
    if (userModel.height != null) {
      _heightController.text = userModel.height.toString();
    }
    if (userModel.age != null) {
      _ageController.text = userModel.age.toString();
    }
  }

  void navigateToTarget(BuildContext context) {
    UserDataProvider.of(context).updateUserData(
      gender: _gender,
      weight: double.tryParse(_weightController.text),
      height: double.tryParse(_heightController.text),
      age: int.tryParse(_ageController.text),
    );
    Navigator.pushNamed(context, AppRoutes.target);
  }

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Базовые параметры')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: _gender,
              hint: Text('Выберите пол'),
              items: [
                DropdownMenuItem(value: 'male', child: Text('Мужской')),
                DropdownMenuItem(value: 'female', child: Text('Женский')),
              ],
              onChanged: (value) {
                setState(() {
                  _gender = value;
                });
              },
            ),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(labelText: 'Вес (кг)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _heightController,
              decoration: InputDecoration(labelText: 'Рост (см)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Возраст'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => navigateToTarget(context),
              child: Text('Следующий вопрос'),
            ),
          ],
        ),
      ),
    );
  }
}
