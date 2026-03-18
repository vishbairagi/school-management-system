class LeaveModel {
  bool? success;
  String? message;
  LeaveDataContainer? data;

  LeaveModel({this.success, this.message, this.data});

  LeaveModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null
        ? LeaveDataContainer.fromJson(json['data'])
        : null;
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

class LeaveDataContainer {
  Student? student;
  Leaves? leaves;

  LeaveDataContainer({this.student, this.leaves});

  LeaveDataContainer.fromJson(Map<String, dynamic> json) {
    student =
    json['student'] != null ? Student.fromJson(json['student']) : null;
    leaves =
    json['leaves'] != null ? Leaves.fromJson(json['leaves']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (student != null) {
      data['student'] = student!.toJson();
    }
    if (leaves != null) {
      data['leaves'] = leaves!.toJson();
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

class Leaves {
  List<LeaveData>? data;
  Pagination? pagination;

  Leaves({this.data, this.pagination});

  Leaves.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(LeaveData.fromJson(v));
      });
    }

    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }

    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }

    return data;
  }
}

class LeaveData {
  String? id;
  String? reason;
  String? leaveDate;
  String? approval;

  LeaveData({this.id, this.reason, this.leaveDate, this.approval});

  LeaveData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reason = json['reason'];
    leaveDate = json['leave_date'];
    approval = json['approval'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['reason'] = reason;
    data['leave_date'] = leaveDate;
    data['approval'] = approval;
    return data;
  }
}

class Pagination {
  int? currentPage;
  int? perPage;
  int? totalPages;
  String? totalRecords;

  Pagination({
    this.currentPage,
    this.perPage,
    this.totalPages,
    this.totalRecords,
  });

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