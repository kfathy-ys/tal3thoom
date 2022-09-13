import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class DiagnosticPaymentModel extends Equatable {
  List<int>? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  DiagnosticPaymentModel(
      {this.data, this.messages, this.status, this.dataLength});

  DiagnosticPaymentModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : List<int>.from(json["data"]);
    messages = json["messages"] ?? [];
    status = json["status"];
    dataLength = json["dataLength"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data["data"] = this.data;
    }
    if (messages != null) {
      data["messages"] = messages;
    }
    data["status"] = status;
    data["dataLength"] = dataLength;
    return data;
  }

  @override
  List<Object?> get props => [data, messages, status, dataLength];
}
