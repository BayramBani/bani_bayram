import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  String? uid;
  String? firstName;
  String? lastName;
  String? email;
  String? photo;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  UserModel({
    this.uid,
    this.firstName,
    this.lastName,
    this.email,
    this.photo,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  String toString() {
    return 'UserModel{uid: $uid, firstName: $firstName, lastName: $lastName, email: $email, photo: $photo, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt}';
  }
}
