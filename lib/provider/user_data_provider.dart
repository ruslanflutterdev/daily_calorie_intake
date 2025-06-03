import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserDataProvider extends InheritedWidget {
  final UserModel userModel;
  final void Function({
  String? gender,
  double? weight,
  double? height,
  int? age,
  String? target,
  String? activityLevel,
  }) updateUserData;

  const UserDataProvider({
    super.key,
    required super.child,
    required this.userModel,
    required this.updateUserData,
  });

  static UserDataProvider of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<UserDataProvider>();
    if (result == null) throw Exception();
    return result;
  }

  @override
  bool updateShouldNotify(covariant UserDataProvider oldWidget) {
    return userModel != oldWidget.userModel;
  }
}
