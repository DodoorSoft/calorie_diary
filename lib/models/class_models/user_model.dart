
class CustomUser{
  String? displayName;
  String? photoUrl;
  String? email;
  bool isSignedIn;

  int? currentWeightInKg;
  int? currentHeightInCm;
  DateTime? birthday;
  int? gender;



  CustomUser({
    this.displayName,
    this.email,
    this.isSignedIn = false,
    this.photoUrl,
    this.currentWeightInKg,
    this.birthday,
    this.currentHeightInCm,
    this.gender
});


}