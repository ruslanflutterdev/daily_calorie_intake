class UserModel {
  final String? gender;
  final double? weight;
  final double? height;
  final int? age;

  UserModel({this.gender, this.weight, this.height, this.age});

  UserModel copyWith({
    String? gender,
    double? weight,
    double? height,
    int? age,
  }) {
    return UserModel(
      gender: gender ?? this.gender,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      age: age ?? this.age,
    );
  }
}
