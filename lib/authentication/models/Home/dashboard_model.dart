class DashboardModel {
  bool? success;
  String? message;
  Data? data;

  DashboardModel({this.success, this.message, this.data});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  Student? student;
  Attendance? attendance;
  Noticeboard? noticebord;


  Data({this.student, this.attendance,this.noticebord});

  Data.fromJson(Map<String, dynamic> json) {
    student =
    json['student'] != null ? Student.fromJson(json['student']) : null;
    attendance = json['attendance'] != null
        ? Attendance.fromJson(json['attendance'])
        : null;
    noticebord = json['noticeboard'] != null
        ? Noticeboard.fromJson(json['noticeboard'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (student != null) {
      map['student'] = student!.toJson();
    }
    if (attendance != null) {
      map['attendance'] = attendance!.toJson();
    }
    return map;
  }
}

class Student {
  String? id;
  School? school;
  String? name;
  String? enrollmentNumber;
  String? session;
  String? studentClass;
  String? section;
  String? rollNumber;
  String? fatherName;
  String? photo;

  Student({
    this.id,
    this.school,
    this.name,
    this.enrollmentNumber,
    this.session,
    this.studentClass,
    this.section,
    this.rollNumber,
    this.fatherName,
    this.photo,
  });

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    school = json['school'] != null ? School.fromJson(json['school']) : null;
    name = json['name'];
    enrollmentNumber = json['enrollment_number'];
    session = json['session'];
    studentClass = json['class'];
    section = json['section'];
    rollNumber = json['roll_number'];
    fatherName = json['father_name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (school != null) {
      map['school'] = school!.toJson();
    }
    map['name'] = name;
    map['enrollment_number'] = enrollmentNumber;
    map['session'] = session;
    map['class'] = studentClass;
    map['section'] = section;
    map['roll_number'] = rollNumber;
    map['father_name'] = fatherName;
    map['photo'] = photo;
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

  School(
      {this.name,
        this.phone,
        this.email,
        this.address,
        this.description,
        this.logo});

  School.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    description = json['description'];
    logo = json['logo'];
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

class Attendance {
  int? totalAttendance;
  int? totalPresent;
  int? totalAbsent;
  int? totalLate;
  int? totalHoliday;
  String? percentageValue;
  String? percentageText;

  Attendance({
    this.totalAttendance,
    this.totalPresent,
    this.totalAbsent,
    this.totalLate,
    this.totalHoliday,
    this.percentageValue,
    this.percentageText,
  });

  Attendance.fromJson(Map<String, dynamic> json) {
    totalAttendance = json['total_attendance'];
    totalPresent = json['total_present'];
    totalAbsent = json['total_absent'];
    totalLate = json['total_late'];
    totalHoliday = json['total_holiday'];
    percentageValue = json['percentage_value'];
    percentageText = json['percentage_text'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_attendance'] = totalAttendance;
    map['total_present'] = totalPresent;
    map['total_absent'] = totalAbsent;
    map['total_late'] = totalLate;
    map['total_holiday'] = totalHoliday;
    map['percentage_value'] = percentageValue;
    map['percentage_text'] = percentageText;
    return map;
  }
}





class Noticeboard {
  String? newNoticeIcon;
  List<NoticeItem>? data;

  Noticeboard({this.newNoticeIcon, this.data});

  Noticeboard.fromJson(Map<String, dynamic> json) {
    newNoticeIcon = json['new_notice_icon'];

    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(NoticeItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['new_notice_icon'] = newNoticeIcon;

    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }

    return map;
  }
}

class NoticeItem {
  String? id;
  String? title;
  String? description;
  String? link;
  String? date;
  bool? isNew;

  NoticeItem({
    this.id,
    this.title,
    this.description,
    this.link,
    this.date,
    this.isNew,
  });

  NoticeItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    link = json['link'];
    date = json['date'];
    isNew = json['is_new'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['link'] = link;
    map['date'] = date;
    map['is_new'] = isNew;

    return map;
  }
}