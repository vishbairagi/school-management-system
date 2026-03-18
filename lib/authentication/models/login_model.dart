class LoginModel {
  LoginModel({
      this.token, 
      this.userEmail, 
      this.userNicename, 
      this.userDisplayName, 
      this.school,});

  LoginModel.fromJson(dynamic json) {
    token = json['token'];
    userEmail = json['user_email'];
    userNicename = json['user_nicename'];
    userDisplayName = json['user_display_name'];
    school = json['shoool'] != null ? School.fromJson(json['school']) : null;
  }
  String? token;
  String? userEmail;
  String? userNicename;
  String? userDisplayName;
  School? school;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['user_email'] = userEmail;
    map['user_nicename'] = userNicename;
    map['user_display_name'] = userDisplayName;
    if (school != null) {
      map['staff'] = school?.toJson();
    }
    return map;
  }

}

class School {
  School({
      //this.id,
      this.name,
      this.phone,
      this.email,
      this.address,
      this.logo,

  });

  School.fromJson(dynamic json) {
  //  id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    logo = json['logo'];
   /* dateOfBirth = json['date_of_birth'];
    dateOfJoin = json['date_of_join'];
    profilePhoto = json['profile_photo'];
    staffDoc = json['staff_doc'];*/
  }
 // String? id;
  String? name;
  String? phone;
  String? email;
  String? address;
  String? logo;
  /*dynamic dateOfBirth;
  String? dateOfJoin;
  String? profilePhoto;
  String? staffDoc;*/

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    //map['id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    map['address'] = address;
    map['logo'] = logo;/*
    map['date_of_birth'] = dateOfBirth;
    map['date_of_join'] = dateOfJoin;
    map['profile_photo'] = profilePhoto;
    map['staff_doc'] = staffDoc;*/
    return map;
  }

}