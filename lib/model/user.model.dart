class UserModel {
  final String name;

  UserModel({
    this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
    };
  }
}
