import 'package:dio/dio.dart';
import 'package:queen/core/helpers/prefs.dart';

class UpdateProfileInputData {
  String? firstName,
      lastName,
      nameArabic,
      joinDate,
      birthDate,
      userName,
      email,
      phoneNumber;
  var profilePic;


  /*
  * this.thesisData.append('jsonString', JSON.stringify(this.thesisDepositionRequest));
*/

  Map<String, dynamic> toJson() {

    var userId = Prefs.getString("userId");
    return {
      "firstName": firstName,
      "lastName": lastName,
      "nameArabic": nameArabic,
      "facebookId": null,
      "googleKey": null,
      "pictureUrl": profilePic is String
          ? profilePic
          : MultipartFile.fromFileSync(profilePic.path,
              filename: profilePic.path),
      "joinDate": joinDate,
      "birthDate": birthDate,
      "countryId": null,
      "country": null,
      "active": true,
      "userRoles": null,
      "id": userId,
      "userName": userName,
      "normalizedUserName": "MORASHAD0@GMAIL.COM",
      "email": email,
      "normalizedEmail": "MORASHAD0@GMAIL.COM",
      "emailConfirmed": false,
      "passwordHash":
          "AQAAAAEAACcQAAAAEJQnjfF9x+waCLsGjFeKg0lG+FFeijmwGKE8UTj5pLghl1p8Ucs++Eej+3IB1RF5cg==",
      "securityStamp": "QEZO6EIVHY3KRQ4KGOD5IOCXOZW6YMBN",
      "concurrencyStamp": "22357c5d-af06-4a17-8086-a43a2ec84753",
      "phoneNumber": phoneNumber,
      "phoneNumberConfirmed": false,
      "twoFactorEnabled": false,
      "lockoutEnd": null,
      "lockoutEnabled": true,
      "accessFailedCount": 0
    };
  }
}
