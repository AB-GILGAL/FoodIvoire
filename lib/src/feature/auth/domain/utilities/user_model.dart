class User {
  String userName;
  String lastName;
  String firstName;
  List<num> preferences;
  List<num> allergies;

  User({
    required this.userName,
    required this.lastName,
    required this.firstName,
    required this.preferences,
    required this.allergies,
  });
  Map<String, dynamic> toJson() => {
    "username":userName,
        "lastName": lastName,
        "firstName": firstName,
        "otherName": lastName.split(' ').last,
        "preferences": preferences.toString(),
        "allergies": allergies.toString(),
      };
}
