import 'package:daily_calorie_intake/core/app_routes.dart';
import 'package:daily_calorie_intake/screens/calorie_basic_parameters_screen.dart';
import 'package:flutter/material.dart';
import 'provider/user_data_state.dart';
import 'screens/calorie_activity_screen.dart';
import 'screens/calorie_target_screen.dart';
import 'screens/calorie_title_screen.dart';
import 'screens/calories_result_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserDataState(
      child: MaterialApp(
        title: 'Расчет суточной нормы калорий',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: AppRoutes.home,
        routes: {
          AppRoutes.home: (context) => CalorieTitleScreen(),
          AppRoutes.basicParameters: (context) => CalorieBasicParametersScreen(),
          AppRoutes.target: (context) => CalorieTargetScreen(),
          AppRoutes.activity: (context) => CalorieActivityScreen(),
          AppRoutes.result: (context) => CaloriesResultScreen(),
        },
      ),
    );
  }
}
