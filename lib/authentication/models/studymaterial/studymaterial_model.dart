class StudyMaterialModel {
  bool? success;
  String? message;
  StudyMaterialDataContainer? data;

  StudyMaterialModel({this.success, this.message, this.data});

  factory StudyMaterialModel.fromJson(Map<String, dynamic> json) {
    return StudyMaterialModel(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null
          ? StudyMaterialDataContainer.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data!.toJson();
    }
    return map;
  }
}

class StudyMaterialDataContainer {
  Student? student;
  StudyMaterial? studyMaterial;

  StudyMaterialDataContainer({this.student, this.studyMaterial});

  factory StudyMaterialDataContainer.fromJson(Map<String, dynamic> json) {
    return StudyMaterialDataContainer(
      student: json['student'] != null ? Student.fromJson(json['student']) : null,
      studyMaterial: json['study_material'] != null
          ? StudyMaterial.fromJson(json['study_material'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (student != null) {
      map['student'] = student!.toJson();
    }
    if (studyMaterial != null) {
      map['study_material'] = studyMaterial!.toJson();
    }
    return map;
  }
}

class Student {
  String? id;
  School? school;

  Student({this.id, this.school});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      school: json['school'] != null ? School.fromJson(json['school']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (school != null) {
      map['school'] = school!.toJson();
    }
    return map;
  }
}

class School {
  String? name;
  String? phone;
  String? email;
  String? address;
  String? description;
  String? logo;

  School({this.name, this.phone, this.email, this.address, this.description, this.logo});

  factory School.fromJson(Map<String, dynamic> json) {
    return School(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      address: json['address'],
      description: json['description'],
      logo: json['logo'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    map['address'] = address;
    map['description'] = description;
    map['logo'] = logo;
    return map;
  }
}

class StudyMaterial {
  String? id;
  String? title;
  String? description;
  int? downloadable;
  String? date;
  String? url;
  List<dynamic>? attachments;

  StudyMaterial({
    this.id,
    this.title,
    this.description,
    this.downloadable,
    this.date,
    this.url,
    this.attachments,
  });

  factory StudyMaterial.fromJson(Map<String, dynamic> json) {
    return StudyMaterial(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      downloadable: json['downloadable'],
      date: json['date'],
      url: json['url'],
      attachments: json['attachments'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['downloadable'] = downloadable;
    map['date'] = date;
    map['url'] = url;
    map['attachments'] = attachments;
    return map;
  }
}