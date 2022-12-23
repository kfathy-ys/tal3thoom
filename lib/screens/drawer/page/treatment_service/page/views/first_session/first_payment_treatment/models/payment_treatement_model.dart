// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:equatable/equatable.dart';

class PaymentAllTreatmentModel extends Equatable {
  PaymentList? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  PaymentAllTreatmentModel(
      {this.data, this.messages, this.status, this.dataLength});

  PaymentAllTreatmentModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : PaymentList.fromJson(json["data"]);
    messages = json["messages"] ?? [];
    status = json["status"];
    dataLength = json["dataLength"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    if (messages != null) {
      _data["messages"] = messages;
    }
    _data["status"] = status;
    _data["dataLength"] = dataLength;
    return _data;
  }

  @override
  List<Object?> get props => [data, messages, status, dataLength];
}

class PaymentList extends Equatable {
  List<int>? subscriptionStages;
  List<DiagnosisSubscriptions>? diagnosisSubscriptions;
  List<TreatmentSubscriptions>? treatmentSubscriptions;

  PaymentList(
      {this.subscriptionStages,
      this.diagnosisSubscriptions,
      this.treatmentSubscriptions});

  PaymentList.fromJson(Map<String, dynamic> json) {
    subscriptionStages = json["subscriptionStages"] == null
        ? null
        : List<int>.from(json["subscriptionStages"]);
    diagnosisSubscriptions = json["diagnosisSubscriptions"] == null
        ? null
        : (json["diagnosisSubscriptions"] as List)
            .map((e) => DiagnosisSubscriptions.fromJson(e))
            .toList();
    treatmentSubscriptions = json["treatmentSubscriptions"] == null
        ? null
        : (json["treatmentSubscriptions"] as List)
            .map((e) => TreatmentSubscriptions.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (subscriptionStages != null) {
      _data["subscriptionStages"] = subscriptionStages;
    }
    if (diagnosisSubscriptions != null) {
      _data["diagnosisSubscriptions"] =
          diagnosisSubscriptions?.map((e) => e.toJson()).toList();
    }
    if (treatmentSubscriptions != null) {
      _data["treatmentSubscriptions"] =
          treatmentSubscriptions?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [subscriptionStages, diagnosisSubscriptions, treatmentSubscriptions];
}

class TreatmentSubscriptions extends Equatable {
  int? id;
  String? title;
  String? description;
  double? price;
  dynamic discount;
  String? displayAt;
  String? createdAt;
  String? createdBy;
  dynamic changedAt;
  dynamic changedBy;

  TreatmentSubscriptions(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.discount,
      this.displayAt,
      this.createdAt,
      this.createdBy,
      this.changedAt,
      this.changedBy});

  TreatmentSubscriptions.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    description = json["description"];
    price = json["price"];
    discount = json["discount"];
    displayAt = json["displayAt"];
    createdAt = json["createdAt"];
    createdBy = json["createdBy"];
    changedAt = json["changedAt"];
    changedBy = json["changedBy"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["description"] = description;
    _data["price"] = price;
    _data["discount"] = discount;
    _data["displayAt"] = displayAt;
    _data["createdAt"] = createdAt;
    _data["createdBy"] = createdBy;
    _data["changedAt"] = changedAt;
    _data["changedBy"] = changedBy;
    return _data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        description,
        price,
        discount,
        displayAt,
        createdAt,
        createdBy,
        changedBy
      ];
}

class DiagnosisSubscriptions extends Equatable {
  int? id;
  String? title;
  String? description;
  double? price;
  dynamic discount;
  String? displayAt;
  String? createdAt;
  String? createdBy;
  dynamic changedAt;
  dynamic changedBy;

  DiagnosisSubscriptions(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.discount,
      this.displayAt,
      this.createdAt,
      this.createdBy,
      this.changedAt,
      this.changedBy});

  DiagnosisSubscriptions.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    description = json["description"];
    price = json["price"];
    discount = json["discount"];
    displayAt = json["displayAt"];
    createdAt = json["createdAt"];
    createdBy = json["createdBy"];
    changedAt = json["changedAt"];
    changedBy = json["changedBy"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["description"] = description;
    _data["price"] = price;
    _data["discount"] = discount;
    _data["displayAt"] = displayAt;
    _data["createdAt"] = createdAt;
    _data["createdBy"] = createdBy;
    _data["changedAt"] = changedAt;
    _data["changedBy"] = changedBy;
    return _data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        description,
        price,
        discount,
        displayAt,
        createdAt,
        createdBy,
        changedAt,
        changedBy,
      ];
}
