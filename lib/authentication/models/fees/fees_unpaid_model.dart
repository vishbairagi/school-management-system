class FeesUnpaidModel {
  bool? success;
  String? message;
  UnpaidData? data; // renamed from Data

  FeesUnpaidModel({this.success, this.message, this.data});

  factory FeesUnpaidModel.fromJson(Map<String, dynamic> json) {
    return FeesUnpaidModel(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? UnpaidData.fromJson(json['data']) : null,
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

class UnpaidData {
  Student? student;
  Invoices? invoices;

  UnpaidData({this.student, this.invoices});

  factory UnpaidData.fromJson(Map<String, dynamic> json) {
    return UnpaidData(
      student: json['student'] != null ? Student.fromJson(json['student']) : null,
      invoices: json['invoices'] != null ? Invoices.fromJson(json['invoices']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'student': student?.toJson(),
      'invoices': invoices?.toJson(),
    };
  }
}
class Data {
  Student? student;
  Invoices? invoices;

  Data({this.student, this.invoices});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      student: json['student'] != null
          ? Student.fromJson(json['student'])
          : null,
      invoices: json['invoices'] != null
          ? Invoices.fromJson(json['invoices'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'student': student?.toJson(),
      'invoices': invoices?.toJson(),
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

class Invoices {
  List<InvoiceItem>? data;

  Invoices({this.data});

  factory Invoices.fromJson(Map<String, dynamic> json) {
    return Invoices(
      data: json['data'] != null
          ? List<InvoiceItem>.from(json['data'].map((x) => InvoiceItem.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}

class InvoiceItem {
  String? id;
  String? invoiceNumber;
  String? invoiceTitle;
  String? payable;
  String? payableDisplay;
  String? paid;
  String? paidDisplay;
  String? due;
  String? dueDisplay;
  String? status;
  String? statusText;
  bool? showPayNow;
  String? dateIssued;
  String? dueDate;

  InvoiceItem({
    this.id,
    this.invoiceNumber,
    this.invoiceTitle,
    this.payable,
    this.payableDisplay,
    this.paid,
    this.paidDisplay,
    this.due,
    this.dueDisplay,
    this.status,
    this.statusText,
    this.showPayNow,
    this.dateIssued,
    this.dueDate,
  });

  factory InvoiceItem.fromJson(Map<String, dynamic> json) {
    return InvoiceItem(
      id: json['id']?.toString(),
      invoiceNumber: json['invoice_number'],
      invoiceTitle: json['invoice_title'],
      payable: json['payable']?.toString(),
      payableDisplay: json['payable_display'],
      paid: json['paid']?.toString(),
      paidDisplay: json['paid_display'],
      due: json['due']?.toString(),
      dueDisplay: json['due_display'],
      status: json['status'],
      statusText: json['status_text'],
      showPayNow: json['show_pay_now'],
      dateIssued: json['date_issued'],
      dueDate: json['due_date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'invoice_number': invoiceNumber,
      'invoice_title': invoiceTitle,
      'payable': payable,
      'payable_display': payableDisplay,
      'paid': paid,
      'paid_display': paidDisplay,
      'due': due,
      'due_display': dueDisplay,
      'status': status,
      'status_text': statusText,
      'show_pay_now': showPayNow,
      'date_issued': dateIssued,
      'due_date': dueDate,
    };
  }
}