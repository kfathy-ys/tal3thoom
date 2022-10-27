// class DiagnosticPaymentModel {
//   List<Packages>? data;
//   int? status;
//   int? dataLength;
//
//   DiagnosticPaymentModel({this.data,  this.status, this.dataLength});
//
//   DiagnosticPaymentModel.fromJson(Map<String, dynamic> json) {
//     data = json["data"] == null ? null : List<Packages>.from(json["data"]);
//     status = json["status"];
//     dataLength = json["dataLength"];
//   }
//
// /*
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//
//     data['status'] = status;
//     data['dataLength'] = dataLength;
//     return data;
//   }
// */
// }
//
// class Packages {
//   int? id;
//   String? title;
//   String? description;
//   double? price;
//   Null? discount;
//   String? displayAt;
//   String? createdAt;
//   String? createdBy;
//   Null? changedAt;
//   Null? changedBy;
//
//   Packages(
//       {this.id,
//         this.title,
//         this.description,
//         this.price,
//         this.discount,
//         this.displayAt,
//         this.createdAt,
//         this.createdBy,
//         this.changedAt,
//         this.changedBy});
//
//   Packages.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     description = json['description'];
//     price = json['price'];
//     discount = json['discount'];
//     displayAt = json['displayAt'];
//     createdAt = json['createdAt'];
//     createdBy = json['createdBy'];
//     changedAt = json['changedAt'];
//     changedBy = json['changedBy'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['id'] = id;
//     data['title'] = title;
//     data['description'] = description;
//     data['price'] = price;
//     data['discount'] = discount;
//     data['displayAt'] = displayAt;
//     data['createdAt'] = createdAt;
//     data['createdBy'] = createdBy;
//     data['changedAt'] = changedAt;
//     data['changedBy'] = changedBy;
//     return data;
//   }
// }
