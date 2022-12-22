// ignore: file_names
class UserModelInfo {
  String? userName;
  String? email;
  String? password;

  UserModelInfo({this.userName, this.email, this.password});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'UserName': userName,
      'Email': email,
      'Password': password
    };
    return map;
  }

  UserModelInfo.fromMap(Map<String, dynamic> map) {
    userName = map['UserName'];
    email = map['Email'];
    password = map['Password'];
  }
}
