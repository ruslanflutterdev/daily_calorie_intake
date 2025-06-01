class UserModel {
  final String? gender;
  final double? weight;
  final double? height;
  final int? age;
  final String? target;

  UserModel({this.gender, this.weight, this.height, this.age, this.target});

  UserModel copyWith({
    String? gender,
    double? weight,
    double? height,
    int? age,
    String? target,
  }) {
    return UserModel(
      gender: gender ?? this.gender,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      age: age ?? this.age,
      target: target ?? this.target,
    );
  }
}
