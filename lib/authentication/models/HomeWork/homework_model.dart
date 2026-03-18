class HomeworkResponse {
  bool? success;
  String? message;
  Data? data;

  HomeworkResponse({this.success, this.message, this.data});

  factory HomeworkResponse.fromJson(Map<String, dynamic> json) {
    return HomeworkResponse(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class Data {
  Student? student;
  Homeworks? homeworks;

  Data({this.student, this.homeworks});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      student: json['student'] != null
          ? Student.fromJson(json['student'])
          : null,
      homeworks: json['homeworks'] != null
          ? Homeworks.fromJson(json['homeworks'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'student': student?.toJson(),
      'homeworks': homeworks?.toJson(),
    };
  }
}

class Student {
  String? id;
  School? school;

  Student({this.id, this.school});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id']?.toString(),
      school: json['school'] != null ? School.fromJson(json['school']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'school': school?.toJson(),
    };
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
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
      'description': description,
      'logo': logo,
    };
  }
}

class Homeworks {
  List<HomeworkItem>? homeworksData;
  Pagination? pagination;

  Homeworks({this.homeworksData, this.pagination});

  factory Homeworks.fromJson(Map<String, dynamic> json) {
    return Homeworks(
      homeworksData: json['homeworks_data'] != null
          ? List<HomeworkItem>.from(
          json['homeworks_data'].map((x) => HomeworkItem.fromJson(x)))
          : [],
      pagination: json['pagination'] != null
          ? Pagination.fromJson(json['pagination'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'homeworks_data': homeworksData?.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }
}

class HomeworkItem {
  String? id;
  String? title;
  String? date;
  String? dueDate;

  HomeworkItem({this.id, this.title, this.date, this.dueDate});

  factory HomeworkItem.fromJson(Map<String, dynamic> json) {
    return HomeworkItem(
      id: json['id']?.toString(),
      title: json['title'],
      date: json['date'],
      dueDate: json['due_date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'due_date': dueDate,
    };
  }
}

class Pagination {
  int? currentPage;
  int? perPage;
  int? totalPages;
  String? totalRecords;

  Pagination({this.currentPage, this.perPage, this.totalPages, this.totalRecords});

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json['current_page'],
      perPage: json['per_page'],
      totalPages: json['total_pages'],
      totalRecords: json['total_records']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current_page': currentPage,
      'per_page': perPage,
      'total_pages': totalPages,
      'total_records': totalRecords,
    };
  }
}