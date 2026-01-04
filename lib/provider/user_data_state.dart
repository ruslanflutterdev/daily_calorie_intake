import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'user_data_provider.dart';

class UserDataState extends StatefulWidget {
  final Widget child;

  const UserDataState({super.key, required this.child});

  @override
  State<UserDataState> createState() => _UserDataStateState();
}

class _UserDataStateState extends State<UserDataState> {
  UserModel _userModel = UserModel();

  void _updateUserData({
    String? gender,
    double? weight,
    double? height,
    int? age,
    String? target,
    String? activityLevel,
  }) {
    setState(() {
      _userModel = _userModel.copyWith(
        gender: gender,
        weight: weight,
        height: height,
        age: age,
        target: target,
        activityLevel: activityLevel,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return UserDataProvider(
      userModel: _userModel,
      updateUserData: _updateUserData,
      child: widget.child,
    );
  }
}
