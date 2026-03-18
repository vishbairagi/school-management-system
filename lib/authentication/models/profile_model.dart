class ProfileModel {
  ProfileModel({
      this.success, 
      this.message, 
      this.data,});

  ProfileModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? success;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.compnayid, 
      this.staffId, 
      this.userId, 
      this.staffName, 
      this.profilePhoto, 
      this.staffDoc, 
      this.staffDateOfJoin, 
      this.email, 
      this.dateOfBirth, 
      this.phoneNo, 
      this.address, 
      this.payType, 
      this.department, 
      this.designation, 
      this.salary, 
      this.leaves, 
      this.createdAt, 
      this.isActive, 
      this.shift,});

  Data.fromJson(dynamic json) {
    compnayid = json['compnayid'];
    staffId = json['staff_id'];
    userId = json['user_id'];
    staffName = json['staffName'];
    profilePhoto = json['profile_photo'];
    staffDoc = json['staff_doc'];
    staffDateOfJoin = json['staffDateOfJoin'];
    email = json['email'];
    dateOfBirth = json['date_of_birth'];
    phoneNo = json['phone_no'];
    address = json['address'];
    payType = json['pay_type'];
    department = json['department'];
    designation = json['designation'];
    salary = json['salary'];
    leaves = json['leaves'];
    createdAt = json['created_at'];
    isActive = json['is_active'];
    shift = json['shift'] != null ? Shift.fromJson(json['shift']) : null;
  }
  String? compnayid;
  String? staffId;
  num? userId;
  String? staffName;
  String? profilePhoto;
  String? staffDoc;
  String? staffDateOfJoin;
  String? email;
  String? dateOfBirth;
  String? phoneNo;
  String? address;
  String? payType;
  String? department;
  String? designation;
  String? salary;
  num? leaves;
  String? createdAt;
  String? isActive;
  Shift? shift;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['compnayid'] = compnayid;
    map['staff_id'] = staffId;
    map['user_id'] = userId;
    map['staffName'] = staffName;
    map['profile_photo'] = profilePhoto;
    map['staff_doc'] = staffDoc;
    map['staffDateOfJoin'] = staffDateOfJoin;
    map['email'] = email;
    map['date_of_birth'] = dateOfBirth;
    map['phone_no'] = phoneNo;
    map['address'] = address;
    map['pay_type'] = payType;
    map['department'] = department;
    map['designation'] = designation;
    map['salary'] = salary;
    map['leaves'] = leaves;
    map['created_at'] = createdAt;
    map['is_active'] = isActive;
    if (shift != null) {
      map['shift'] = shift?.toJson();
    }
    return map;
  }

}

class Shift {
  Shift({
      this.title, 
      this.startTime, 
      this.endTime, 
      this.lateTime,});

  Shift.fromJson(dynamic json) {
    title = json['title'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    lateTime = json['late_time'];
  }
  String? title;
  String? startTime;
  String? endTime;
  String? lateTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['start_time'] = startTime;
    map['end_time'] = endTime;
    map['late_time'] = lateTime;
    return map;
  }

}