class UsersModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? bio;
  final String? profilePicture;
  final int? points;
  final String? mobile;
  final int? countryCode;
  final bool? isVerified;
  final bool? isTrusted;

  UsersModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.bio,
    this.profilePicture,
    this.points,
    this.mobile,
    this.countryCode,
    this.isVerified,
    this.isTrusted,
  });

}
