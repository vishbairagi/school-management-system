class TimetableModel {
  bool? success;
  String? message;
  Data? data;

  TimetableModel({this.success, this.message, this.data});

  TimetableModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Student? student;
  ClassTimeTable? classTimeTable;

  Data({this.student, this.classTimeTable});

  Data.fromJson(Map<String, dynamic> json) {
    student =
    json['student'] != null ? Student.fromJson(json['student']) : null;
    classTimeTable = json['class_time_table'] != null
        ? ClassTimeTable.fromJson(json['class_time_table'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (student != null) {
      data['student'] = student!.toJson();
    }
    if (classTimeTable != null) {
      data['class_time_table'] = classTimeTable!.toJson();
    }
    return data;
  }
}

class Student {
  String? id;
  School? school;

  Student({this.id, this.school});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    school =
    json['school'] != null ? School.fromJson(json['school']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    if (school != null) {
      data['school'] = school!.toJson();
    }
    return data;
  }
}

class School {
  String? name;
  String? phone;
  String? email;
  String? address;
  String? description;
  String? logo;

  School({
    this.name,
    this.phone,
    this.email,
    this.address,
    this.description,
    this.logo,
  });

  School.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    description = json['description'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['address'] = address;
    data['description'] = description;
    data['logo'] = logo;
    return data;
  }
}

class ClassTimeTable {
  String? studentClass;
  String? section;
  List<ClassTimeTableData>? classTimeTableData;

  ClassTimeTable({this.studentClass, this.section, this.classTimeTableData});

  ClassTimeTable.fromJson(Map<String, dynamic> json) {
    studentClass = json['class'];
    section = json['section'];

    if (json['class_time_table_data'] != null) {
      classTimeTableData = [];
      json['class_time_table_data'].forEach((v) {
        classTimeTableData!.add(ClassTimeTableData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['class'] = studentClass;
    data['section'] = section;

    if (classTimeTableData != null) {
      data['class_time_table_data'] =
          classTimeTableData!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class ClassTimeTableData {
  String? day;
  List<Routine>? routines;

  ClassTimeTableData({this.day, this.routines});

  ClassTimeTableData.fromJson(Map<String, dynamic> json) {
    day = json['day'];

    if (json['routines'] != null) {
      routines = [];
      json['routines'].forEach((v) {
        routines!.add(Routine.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['day'] = day;

    if (routines != null) {
      data['routines'] = routines!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Routine {
  String? subject;
  String? startTime;
  String? endTime;
  String? room;
  String? teacherName;

  Routine({
    this.subject,
    this.startTime,
    this.endTime,
    this.room,
    this.teacherName,
  });

  Routine.fromJson(Map<String, dynamic> json) {
    subject = json['subject'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    room = json['room'];
    teacherName = json['teacher_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['subject'] = subject;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['room'] = room;
    data['teacher_name'] = teacherName;
    return data;
  }
}