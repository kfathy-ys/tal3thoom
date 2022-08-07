import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserModel extends Equatable {
  String? firstName;
  String? lastName;
  String? nameArabic;
  dynamic facebookId;
  dynamic googleKey;
  dynamic pictureUrl;
  String? joinDate;
  String? birthDate;
  dynamic countryId;
  dynamic country;
  bool? active;
  dynamic userRoles;
  String? id;
  String? userName;
  String? normalizedUserName;
  String? email;
  String? normalizedEmail;
  bool? emailConfirmed;
  String? passwordHash;
  String? securityStamp;
  String? concurrencyStamp;
  String? phoneNumber;
  bool? phoneNumberConfirmed;
  bool? twoFactorEnabled;
  dynamic lockoutEnd;
  bool? lockoutEnabled;
  int? accessFailedCount;

  UserModel(
      {this.firstName,
      this.lastName,
      this.nameArabic,
      this.facebookId,
      this.googleKey,
      this.pictureUrl,
      this.joinDate,
      this.birthDate,
      this.countryId,
      this.country,
      this.active,
      this.userRoles,
      this.id,
      this.userName,
      this.normalizedUserName,
      this.email,
      this.normalizedEmail,
      this.emailConfirmed,
      this.passwordHash,
      this.securityStamp,
      this.concurrencyStamp,
      this.phoneNumber,
      this.phoneNumberConfirmed,
      this.twoFactorEnabled,
      this.lockoutEnd,
      this.lockoutEnabled,
      this.accessFailedCount});
  @override
  List<Object?> get props {
    return [
      firstName,
      lastName,
      nameArabic,
      facebookId,
      googleKey,
      pictureUrl,
      joinDate,
      birthDate,
      countryId,
      country,
      active,
      userRoles,
      id,
      userName,
      normalizedUserName,
      email,
      normalizedEmail,
      emailConfirmed,
      passwordHash,
      securityStamp,
      concurrencyStamp,
      phoneNumber,
      phoneNumberConfirmed,
      twoFactorEnabled,
      lockoutEnd,
      lockoutEnabled,
      accessFailedCount,
    ];
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json["firstName"];
    lastName = json["lastName"];
    nameArabic = json["nameArabic"];
    facebookId = json["facebookId"];
    googleKey = json["googleKey"];
    pictureUrl = json["pictureUrl"];
    joinDate = json["joinDate"];
    birthDate = json["birthDate"];
    countryId = json["countryId"];
    country = json["country"];
    active = json["active"];
    userRoles = json["userRoles"];
    id = json["id"];
    userName = json["userName"];
    normalizedUserName = json["normalizedUserName"];
    email = json["email"];
    normalizedEmail = json["normalizedEmail"];
    emailConfirmed = json["emailConfirmed"];
    passwordHash = json["passwordHash"];
    securityStamp = json["securityStamp"];
    concurrencyStamp = json["concurrencyStamp"];
    phoneNumber = json["phoneNumber"];
    phoneNumberConfirmed = json["phoneNumberConfirmed"];
    twoFactorEnabled = json["twoFactorEnabled"];
    lockoutEnd = json["lockoutEnd"];
    lockoutEnabled = json["lockoutEnabled"];
    accessFailedCount = json["accessFailedCount"];
  }
// userInfo.toJson
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["firstName"] = firstName;
    data["lastName"] = lastName;
    data["nameArabic"] = nameArabic;
    data["facebookId"] = facebookId;
    data["googleKey"] = googleKey;
    data["pictureUrl"] = pictureUrl;
    data["joinDate"] = joinDate;
    data["birthDate"] = birthDate;
    data["countryId"] = countryId;
    data["country"] = country;
    data["active"] = active;
    data["userRoles"] = userRoles;
    data["id"] = id;
    data["userName"] = userName;
    data["normalizedUserName"] = normalizedUserName;
    data["email"] = email;
    data["normalizedEmail"] = normalizedEmail;
    data["emailConfirmed"] = emailConfirmed;
    data["passwordHash"] = passwordHash;
    data["securityStamp"] = securityStamp;
    data["concurrencyStamp"] = concurrencyStamp;
    data["phoneNumber"] = phoneNumber;
    data["phoneNumberConfirmed"] = phoneNumberConfirmed;
    data["twoFactorEnabled"] = twoFactorEnabled;
    data["lockoutEnd"] = lockoutEnd;
    data["lockoutEnabled"] = lockoutEnabled;
    data["accessFailedCount"] = accessFailedCount;
    return data;
  }
}
