
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TopThreeModels extends Equatable{
  List<TopThreeData>? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  TopThreeModels({this.data, this.messages, this.status, this.dataLength});

  TopThreeModels.fromJson(Map<String, dynamic> json) {
    data = json["data"]==null ? null : (json["data"] as List).map((e)=>TopThreeData.fromJson(e)).toList();
    messages = json["messages"] ?? [];
    status = json["status"];
    dataLength = json["dataLength"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(this.data != null) {
      data["data"] = this.data?.map((e)=>e.toJson()).toList();
    }
    if(messages != null) {
      data["messages"] = messages;
    }
    data["status"] = status;
    data["dataLength"] = dataLength;
    return data;
  }

  @override

  List<Object?> get props => [data,dataLength,messages,status];
}

class TopThreeData extends Equatable{
  int? code;
  String? requestName;
  int? requestsCount;

  TopThreeData({this.code, this.requestName, this.requestsCount});

  TopThreeData.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    requestName = json["requestName"];
    requestsCount = json["requestsCount"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["code"] = code;
    data["requestName"] = requestName;
    data["requestsCount"] = requestsCount;
    return data;
  }

  @override

  List<Object?> get props {
   return[
    code,
   requestName,
    requestsCount,
   ];
 }
}