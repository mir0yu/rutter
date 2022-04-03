/// id : 1
/// username : "mirosh"
/// first_name : "Мирошниченко"
/// last_name : "Игорь"
/// avatar : "http://127.0.0.1:8080/avatars/violet.jpg"
/// date_of_birth : "2002-09-22"
/// last_time_visit : "2022-03-20T11:19:59.663078Z"

class UserModel {
  UserModel({
      int? id, 
      String? username, 
      String? firstName, 
      String? lastName, 
      String? avatar, 
      String? dateOfBirth, 
      String? lastTimeVisit,}){
    _id = id;
    _username = username;
    _firstName = firstName;
    _lastName = lastName;
    _avatar = avatar;
    _dateOfBirth = dateOfBirth;
    _lastTimeVisit = lastTimeVisit;
}

  UserModel.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _avatar = json['avatar'];
    _dateOfBirth = json['date_of_birth'];
    _lastTimeVisit = json['last_time_visit'];
  }
  int? _id;
  String? _username;
  String? _firstName;
  String? _lastName;
  String? _avatar;
  String? _dateOfBirth;
  String? _lastTimeVisit;
UserModel copyWith({  int? id,
  String? username,
  String? firstName,
  String? lastName,
  String? avatar,
  String? dateOfBirth,
  String? lastTimeVisit,
}) => UserModel(  id: id ?? _id,
  username: username ?? _username,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  avatar: avatar ?? _avatar,
  dateOfBirth: dateOfBirth ?? _dateOfBirth,
  lastTimeVisit: lastTimeVisit ?? _lastTimeVisit,
);
  int? get id => _id;
  String? get username => _username;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get avatar => _avatar;
  String? get dateOfBirth => _dateOfBirth;
  String? get lastTimeVisit => _lastTimeVisit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['avatar'] = _avatar;
    map['date_of_birth'] = _dateOfBirth;
    map['last_time_visit'] = _lastTimeVisit;
    return map;
  }

}