
enum SignUpType{
  google,
  mail,
  apple
}


class CustomUser{
  String? displayName;
  String? photoUrl;
  String? email;
  bool isSignedIn;

  double? currentWeightInKg;
  int? heightInCm;
  DateTime? birthday;
  int? gender;



  CustomUser({
    this.displayName,
    this.email,
    this.isSignedIn = false,
    this.photoUrl,
    this.currentWeightInKg,
    this.birthday,
    this.heightInCm,
    this.gender
});

  Map<String,dynamic> toJSON(){
    return {
      "displayName":displayName,
      "email":email,
      "isSignedIn":isSignedIn,
      "photoUrl":photoUrl,
      "currentWeightInKg":currentWeightInKg,
      "heightInCm":heightInCm,
      "gender":gender

    };
  }


}