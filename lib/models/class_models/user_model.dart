
class CustomUser{
  String? displayName;
  String? id;
  String? photoUrl;
  String? email;
  bool isSignedIn;


  CustomUser({
    this.displayName,
    this.id,
    this.email,
    this.photoUrl,
    this.isSignedIn = false
});


}