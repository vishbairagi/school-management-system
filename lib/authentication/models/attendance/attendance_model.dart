class AttendanceModel {
  bool? success;
  String? message;
  AttendanceData? data;

  AttendanceModel({this.success, this.message, this.data});

  AttendanceModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? AttendanceData.fromJson(json['data']) : null;
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

class AttendanceData {
  Student? student;
  Attendance? attendance;

  AttendanceData({this.student, this.attendance});

  AttendanceData.fromJson(Map<String, dynamic> json) {
    student =
    json['student'] != null ? Student.fromJson(json['student']) : null;
    attendance = json['attendance'] != null
        ? Attendance.fromJson(json['attendance'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (student != null) {
      data['student'] = student!.toJson();
    }
    if (attendance != null) {
      data['attendance'] = attendance!.toJson();
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

class Attendance {
  Overall? overall;
  List<Monthly>? monthly;
  List<dynamic>? subjectWise;

  Attendance({this.overall, this.monthly, this.subjectWise});

  Attendance.fromJson(Map<String, dynamic> json) {
    overall =
    json['overall'] != null ? Overall.fromJson(json['overall']) : null;

    if (json['monthly'] != null) {
      monthly = [];
      json['monthly'].forEach((v) {
        monthly!.add(Monthly.fromJson(v));
      });
    }

    subjectWise = json['subject_wise'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (overall != null) {
      data['overall'] = overall!.toJson();
    }

    if (monthly != null) {
      data['monthly'] = monthly!.map((v) => v.toJson()).toList();
    }

    data['subject_wise'] = subjectWise;

    return data;
  }
}

class Overall {
  int? totalAttendance;
  int? totalPresent;
  int? totalAbsent;
  String? percentageValue;
  String? percentageText;

  Overall({
    this.totalAttendance,
    this.totalPresent,
    this.totalAbsent,
    this.percentageValue,
    this.percentageText,
  });

  Overall.fromJson(Map<String, dynamic> json) {
    totalAttendance = json['total_attendance'];
    totalPresent = json['total_present'];
    totalAbsent = json['total_absent'];
    percentageValue = json['percentage_value'];
    percentageText = json['percentage_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['total_attendance'] = totalAttendance;
    data['total_present'] = totalPresent;
    data['total_absent'] = totalAbsent;
    data['percentage_value'] = percentageValue;
    data['percentage_text'] = percentageText;
    return data;
  }
}

class Monthly {
  String? month;
  String? totalAttendance;
  String? totalPresent;
  String? totalAbsent;
  String? totalHolidays;
  String? totalLate;

  Monthly({
    this.month,
    this.totalAttendance,
    this.totalPresent,
    this.totalAbsent,
    this.totalHolidays,
    this.totalLate,
  });

  Monthly.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    totalAttendance = json['total_attendance'];
    totalPresent = json['total_present'];
    totalAbsent = json['total_absent'];
    totalHolidays = json['total_holidays'];
    totalLate = json['total_late'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['month'] = month;
    data['total_attendance'] = totalAttendance;
    data['total_present'] = totalPresent;
    data['total_absent'] = totalAbsent;
    data['total_holidays'] = totalHolidays;
    data['total_late'] = totalLate;
    return data;
  }
}