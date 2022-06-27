
class CustomUser{
  String? displayName;
  String? id;
  String? photoUrl;
  String? email;
  bool isSignedIn;

  int? currentKilos;
  int? currentHeightInCm;
  int? age;



  CustomUser({
    this.displayName,
    this.id,
    this.email,
    this.photoUrl,
    this.isSignedIn = false,
    this.currentKilos,
    this.age,
    this.currentHeightInCm
});


}