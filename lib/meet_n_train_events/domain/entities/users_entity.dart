import 'package:meetntrain/meet_n_train_events/data/models/users_model.dart';

class UsersEntity extends UsersModel {
  UsersEntity({
    super.id,
    super.firstName,
    super.lastName,
    super.email,
    super.bio,
    super.profilePicture,
    super.points,
    super.mobile,
    super.countryCode,
    super.isVerified,
    super.isTrusted,
  });

  factory UsersEntity.fromJson(Map<String, dynamic> json) {
    return UsersEntity(
      id: json["id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      bio: json["bio"],
      profilePicture: json["profile_picture"],
      points: json["points"],
      mobile: json["mobile"],
      countryCode: json["countryCode"],
      isVerified: json["isVerified"],
      isTrusted: json["isTrusted"],
    );
  }
}
