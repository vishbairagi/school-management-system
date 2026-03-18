class LiveClassResponse {
  bool? success;
  String? message;
  Data? data;

  LiveClassResponse({
    this.success,
    this.message,
    this.data,
  });

  factory LiveClassResponse.fromJson(Map<String, dynamic> json) {
    return LiveClassResponse(
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
  LiveClasses? liveClasses;

  Data({
    this.student,
    this.liveClasses,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      student: json['student'] != null
          ? Student.fromJson(json['student'])
          : null,
      liveClasses: json['live_classes'] != null
          ? LiveClasses.fromJson(json['live_classes'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'student': student?.toJson(),
      'live_classes': liveClasses?.toJson(),
    };
  }
}

class Student {
  String? id;
  School? school;

  Student({
    this.id,
    this.school,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id']?.toString(),
      school: json['school'] != null
          ? School.fromJson(json['school'])
          : null,
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

  School({
    this.name,
    this.phone,
    this.email,
    this.address,
    this.description,
    this.logo,
  });

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

class LiveClasses {
  List<LiveClassItem>? data;
  Pagination? pagination;

  LiveClasses({
    this.data,
    this.pagination,
  });

  factory LiveClasses.fromJson(Map<String, dynamic> json) {
    return LiveClasses(
      data: json['data'] != null
          ? List<LiveClassItem>.from(
          json['data'].map((x) => LiveClassItem.fromJson(x)))
          : [],
      pagination: json['pagination'] != null
          ? Pagination.fromJson(json['pagination'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }
}

class LiveClassItem {
  String? id;
  String? title;
  String? link;
  String? date;
  String? time;

  LiveClassItem({
    this.id,
    this.title,
    this.link,
    this.date,
    this.time,
  });

  factory LiveClassItem.fromJson(Map<String, dynamic> json) {
    return LiveClassItem(
      id: json['id']?.toString(),
      title: json['title'],
      link: json['link'],
      date: json['date'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'link': link,
      'date': date,
      'time': time,
    };
  }
}

class Pagination {
  int? currentPage;
  int? perPage;

  Pagination({
    this.currentPage,
    this.perPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json['current_page'],
      perPage: json['per_page'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current_page': currentPage,
      'per_page': perPage,
    };
  }
}