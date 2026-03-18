class EventsModel {
  bool? success;
  String? message;
  EventsDataContainer? data;

  EventsModel({this.success, this.message, this.data});

  factory EventsModel.fromJson(Map<String, dynamic> json) {
    return EventsModel(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null
          ? EventsDataContainer.fromJson(json['data'])
          : null,
    );
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

class EventsDataContainer {
  Student? student;
  Events? events;

  EventsDataContainer({this.student, this.events});

  factory EventsDataContainer.fromJson(Map<String, dynamic> json) {
    return EventsDataContainer(
      student: json['student'] != null ? Student.fromJson(json['student']) : null,
      events: json['events'] != null ? Events.fromJson(json['events']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (student != null) {
      map['student'] = student!.toJson();
    }
    if (events != null) {
      map['events'] = events!.toJson();
    }
    return map;
  }
}

class Student {
  String? id;
  School? school;

  Student({this.id, this.school});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      school: json['school'] != null ? School.fromJson(json['school']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (school != null) {
      map['school'] = school!.toJson();
    }
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

class Events {
  List<EventData>? eventsData;
  Pagination? pagination;

  Events({this.eventsData, this.pagination});

  factory Events.fromJson(Map<String, dynamic> json) {
    return Events(
      eventsData: json['events_data'] != null
          ? List<EventData>.from(
          (json['events_data'] as List).map((x) => EventData.fromJson(x)))
          : [],
      pagination: json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['events_data'] = eventsData?.map((x) => x.toJson()).toList();
    if (pagination != null) {
      map['pagination'] = pagination!.toJson();
    }
    return map;
  }
}

class EventData {
  String? id;
  String? title;
  String? eventDate;
  String? image;
  String? description;
  bool? hasJoined;

  EventData({this.id, this.title, this.eventDate, this.image, this.description, this.hasJoined});

  factory EventData.fromJson(Map<String, dynamic> json) {
    return EventData(
      id: json['id'],
      title: json['title'],
      eventDate: json['event_date'],
      image: json['image'],
      description: json['description'],
      hasJoined: json['has_joined'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['event_date'] = eventDate;
    map['image'] = image;
    map['description'] = description;
    map['has_joined'] = hasJoined;
    return map;
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
      totalRecords: json['total_records'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = currentPage;
    map['per_page'] = perPage;
    map['total_pages'] = totalPages;
    map['total_records'] = totalRecords;
    return map;
  }
}