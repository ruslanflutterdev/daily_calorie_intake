class CalorieCalculator {
  static double calculateBMR({
    required String gender,
    required double weight,
    required double height,
    required int age,
  }) {
    if (gender == 'male') {
      return (10 * weight) + (6.25 * height) - (5 * age) + 5;
    } else if (gender == 'female') {
      return (10 * weight) + (6.25 * height) - (5 * age) - 161;
    } else {
      throw Exception('Неизвестный пол для расчета BMR');
    }
  }

  static double calculateTDEE({
    required double bmr,
    required String activityLevel,
  }) {
    double activityMultiplier;

    switch (activityLevel) {
      case 'sedentary':
        activityMultiplier = 1.2;
        break;
      case 'light':
        activityMultiplier = 1.375;
        break;
      case 'moderate':
        activityMultiplier = 1.55;
        break;
      case 'high':
        activityMultiplier = 1.725;
        break;
      case 'very_high':
        activityMultiplier = 1.9;
        break;
      default:
        throw Exception('Неизвестный уровень активности для расчета TDEE');
    }
    return bmr * activityMultiplier;
  }

  static double calculateAdjustedTDEE({
    required double tdee,
    required String target,
  }) {
    switch (target) {
      case 'Похудение':
        return tdee * 0.85;
      case 'Набор массы':
        return tdee * 1.15;
      case 'Поддержание веса':
        return tdee;
      default:
        throw Exception('Неизвестная цель для корректировки TDEE');
    }
  }
}
