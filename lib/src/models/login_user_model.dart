class LoginUserModel {
  String displayName, email;
  String? photoUrl;
  String? uid;

  LoginUserModel(
      {required this.displayName,
      required this.email,
      this.photoUrl,
      this.uid});
}
