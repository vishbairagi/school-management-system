class ResultModel {
  bool? success;
  String? message;
  ResultData? data;

  ResultModel({this.success, this.message, this.data});

  ResultModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? ResultData.fromJson(json['data']) : null;
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

class ResultData {
  Student? student;
  Result? result;

  ResultData({this.student, this.result});

  ResultData.fromJson(Map<String, dynamic> json) {
    student =
    json['student'] != null ? Student.fromJson(json['student']) : null;
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (student != null) {
      data['student'] = student!.toJson();
    }
    if (result != null) {
      data['result'] = result!.toJson();
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

class Result {
  String? studentName;
  String? enrollmentNumber;
  String? session;
  String? studentClass;
  String? section;
  String? rollNumber;
  String? phone;
  String? fatherName;
  String? fatherPhone;
  List<ExamData>? data;
  String? overallMaximumMarks;
  String? overallObtainedMarks;
  String? overallPercentageValue;
  String? overallPercentageText;

  Result({
    this.studentName,
    this.enrollmentNumber,
    this.session,
    this.studentClass,
    this.section,
    this.rollNumber,
    this.phone,
    this.fatherName,
    this.fatherPhone,
    this.data,
    this.overallMaximumMarks,
    this.overallObtainedMarks,
    this.overallPercentageValue,
    this.overallPercentageText,
  });

  Result.fromJson(Map<String, dynamic> json) {
    studentName = json['student_name'];
    enrollmentNumber = json['enrollment_number'];
    session = json['session'];
    studentClass = json['class'];
    section = json['section'];
    rollNumber = json['roll_number'];
    phone = json['phone'];
    fatherName = json['father_name'];
    fatherPhone = json['father_phone'];

    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(ExamData.fromJson(v));
      });
    }

    overallMaximumMarks = json['overall_maximum_marks'];
    overallObtainedMarks = json['overall_obtained_marks'];
    overallPercentageValue = json['overall_percentage_value'];
    overallPercentageText = json['overall_percentage_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['student_name'] = studentName;
    data['enrollment_number'] = enrollmentNumber;
    data['session'] = session;
    data['class'] = studentClass;
    data['section'] = section;
    data['roll_number'] = rollNumber;
    data['phone'] = phone;
    data['father_name'] = fatherName;
    data['father_phone'] = fatherPhone;

    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }

    data['overall_maximum_marks'] = overallMaximumMarks;
    data['overall_obtained_marks'] = overallObtainedMarks;
    data['overall_percentage_value'] = overallPercentageValue;
    data['overall_percentage_text'] = overallPercentageText;

    return data;
  }
}

class ExamData {
  String? id;
  String? title;
  String? examDate;
  String? maximumMarks;
  String? obtainedMarks;
  String? percentageValue;
  String? percentageText;

  ExamData({
    this.id,
    this.title,
    this.examDate,
    this.maximumMarks,
    this.obtainedMarks,
    this.percentageValue,
    this.percentageText,
  });

  ExamData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    examDate = json['exam_date'];
    maximumMarks = json['maximum_marks'];
    obtainedMarks = json['obtained_marks'];
    percentageValue = json['percentage_value'];
    percentageText = json['percentage_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['exam_date'] = examDate;
    data['maximum_marks'] = maximumMarks;
    data['obtained_marks'] = obtainedMarks;
    data['percentage_value'] = percentageValue;
    data['percentage_text'] = percentageText;
    return data;
  }
}