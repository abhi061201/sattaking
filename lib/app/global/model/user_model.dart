class UserModel {
  String? userid;
  String? username;
  String? mobile_no;
  // String? password;
  String? email;
  UserModel(
      {this.email, this.mobile_no, this.userid, this.username});
  UserModel.fromMap(Map<String, dynamic> mp) {
    userid = mp['userid'];
    username = mp['username'];
    mobile_no = mp['mobile_no'];
    // password = mp['password'];
    email = mp['email'];
  }

  Map<String, dynamic> toMap() {
    return {
      "userid": userid,
      "username": username,
      "mobile_no": mobile_no,
      // "password": password,
      "email": email,
    };
  }
}
