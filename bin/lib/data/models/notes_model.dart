class NotesResponseModel {
  String? message;
  int? status;
  List<NotesModel>? notes;

  NotesResponseModel({this.message, this.status, this.notes});

  factory NotesResponseModel.fromJson(Map<String, dynamic> json) {
    return NotesResponseModel(
      message: json['message'] ?? "",
      status: json['status'] ?? 500,
      notes: json['notes'] == null
          ? null
          : List<NotesModel>.from(json['notes'].map((x) => NotesModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message ?? "",
      'status': status ?? 500,
      'notes': notes == null ? null : List<dynamic>.from(notes!.map((x) => x.toJson())),
    };
  }
}

class NotesModel {
  String? title;
  String? description;
  int? id;

  NotesModel({this.title, this.description, required id});

  factory NotesModel.fromJson(Map<String, dynamic> json) {
    return NotesModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? "",
      description: json['description'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id ?? 0,
      'title': title ?? "",
      'description': description ?? "",
    };
  }
}
