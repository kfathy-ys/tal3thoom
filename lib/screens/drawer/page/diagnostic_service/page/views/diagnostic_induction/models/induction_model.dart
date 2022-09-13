import 'package:equatable/equatable.dart';

class InductionDiagnosticModel extends Equatable {
  Data? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  InductionDiagnosticModel(
      {this.data, this.messages, this.status, this.dataLength});

  InductionDiagnosticModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
    messages = json["messages"] ?? [];
    status = json["status"];
    dataLength = json["dataLength"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data["data"] = this.data?.toJson();
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

class Data extends Equatable {
  int? id;
  int? stageId;
  dynamic? stageDiagnosesId;
  String? instructionHeader;
  String? instructionDetails;
  String? videoUrl;

  Data(
      {this.id,
      this.stageId,
      this.stageDiagnosesId,
      this.instructionHeader,
      this.instructionDetails,
      this.videoUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    stageId = json["stageId"];
    stageDiagnosesId = json["stageDiagnosesId"];
    instructionHeader = json["instructionHeader"];
    instructionDetails = json["instructionDetails"];
    videoUrl = json["videoUrl"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["stageId"] = stageId;
    data["stageDiagnosesId"] = stageDiagnosesId;
    data["instructionHeader"] = instructionHeader;
    data["instructionDetails"] = instructionDetails;
    data["videoUrl"] = videoUrl;
    return data;
  }

  @override
  List<Object?> get props {
    return [
      id,
      stageId,
      stageDiagnosesId,
      instructionHeader,
      instructionDetails,
      videoUrl
    ];
  }
}
