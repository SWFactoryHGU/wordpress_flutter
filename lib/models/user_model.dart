class UserModel {
  String token;
  String user_email;
  String user_nicename;
  String user_display_name;

  UserModel(
      this.token, this.user_email, this.user_nicename, this.user_display_name);

  UserModel.fromJson(Map<String, dynamic> parsedJson) {
    token = parsedJson['token'];
    user_email = (parsedJson['user_email']);
    user_nicename = (parsedJson['user_nicename']);
    user_display_name = parsedJson['user_display_name'];
  }
}
