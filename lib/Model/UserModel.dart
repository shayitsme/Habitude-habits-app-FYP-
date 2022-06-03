class UserModel {
  late String email;
  late String password;

  UserModel(this.email, this.password);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'email':email,
      'password':password
    };
    return map;
  }
  UserModel.fromMap(Map<String, dynamic> map){
    email = map['email'];
    password = map['password'];
  }
}