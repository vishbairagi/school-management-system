class NoticeboardModel {
  bool? success;
  String? message;
  Data? data;

  NoticeboardModel({this.success, this.message, this.data});

  NoticeboardModel.fromJson(Map<String, dynamic> json) {
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
  Noticeboard? noticeboard;

  Data({this.student, this.noticeboard});

  Data.fromJson(Map<String, dynamic> json) {
    student =
    json['student'] != null ? Student.fromJson(json['student']) : null;
    noticeboard = json['noticeboard'] != null
        ? Noticeboard.fromJson(json['noticeboard'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (student != null) {
      data['student'] = student!.toJson();
    }
    if (noticeboard != null) {
      data['noticeboard'] = noticeboard!.toJson();
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

class Noticeboard {
  String? newNoticeIcon;
  List<NoticeData>? data;
  Pagination? pagination;

  Noticeboard({this.newNoticeIcon, this.data, this.pagination});

  Noticeboard.fromJson(Map<String, dynamic> json) {
    newNoticeIcon = json['new_notice_icon'];

    if (json['data'] != null) {
      data = <NoticeData>[];
      json['data'].forEach((v) {
        data!.add(NoticeData.fromJson(v));
      });
    }

    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['new_notice_icon'] = newNoticeIcon;

    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }

    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }

    return data;
  }
}

class NoticeData {
  String? id;
  String? title;
  String? description;
  String? link;
  String? date;
  bool? isNew;

  NoticeData(
      {this.id,
        this.title,
        this.description,
        this.link,
        this.date,
        this.isNew});

  NoticeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    link = json['link'];
    date = json['date'];
    isNew = json['is_new'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['link'] = link;
    data['date'] = date;
    data['is_new'] = isNew;

    return data;
  }
}

class Pagination {
  int? currentPage;
  int? perPage;
  int? totalPages;
  String? totalRecords;

  Pagination(
      {this.currentPage,
        this.perPage,
        this.totalPages,
        this.totalRecords});

  Pagination.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    perPage = json['per_page'];
    totalPages = json['total_pages'];
    totalRecords = json['total_records'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['current_page'] = currentPage;
    data['per_page'] = perPage;
    data['total_pages'] = totalPages;
    data['total_records'] = totalRecords;

    return data;
  }
}