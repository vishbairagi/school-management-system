class FeeHistoryResponse {
  bool? success;
  String? message;
  HistoryData? data; // renamed from Data

  FeeHistoryResponse({this.success, this.message, this.data});

  factory FeeHistoryResponse.fromJson(Map<String, dynamic> json) {
    return FeeHistoryResponse(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? HistoryData.fromJson(json['data']) : null,
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

class HistoryData {
  Student? student;
  Payments? payments;

  HistoryData({this.student, this.payments});

  factory HistoryData.fromJson(Map<String, dynamic> json) {
    return HistoryData(
      student: json['student'] != null ? Student.fromJson(json['student']) : null,
      payments: json['payments'] != null ? Payments.fromJson(json['payments']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'student': student?.toJson(),
      'payments': payments?.toJson(),
    };
  }
}
class Data {
  Student? student;
  Payments? payments;

  Data({this.student, this.payments});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      student: json['student'] != null
          ? Student.fromJson(json['student'])
          : null,
      payments: json['payments'] != null
          ? Payments.fromJson(json['payments'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'student': student?.toJson(),
      'payments': payments?.toJson(),
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

class Payments {
  List<PaymentItem>? data;
  Pagination? pagination;

  Payments({this.data, this.pagination});

  factory Payments.fromJson(Map<String, dynamic> json) {
    return Payments(
      data: json['data'] != null
          ? List<PaymentItem>.from(
          json['data'].map((x) => PaymentItem.fromJson(x)))
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

class PaymentItem {
  String? id;
  String? amount;
  String? date;
  String? method;
  // Add more fields if your API returns

  PaymentItem({this.id, this.amount, this.date, this.method});

  factory PaymentItem.fromJson(Map<String, dynamic> json) {
    return PaymentItem(
      id: json['id']?.toString(),
      amount: json['amount']?.toString(),
      date: json['date'],
      method: json['method'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'date': date,
      'method': method,
    };
  }
}

class Pagination {
  int? currentPage;
  int? perPage;

  Pagination({this.currentPage, this.perPage});

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