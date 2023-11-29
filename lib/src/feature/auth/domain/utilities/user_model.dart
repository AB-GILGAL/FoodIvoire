
class User {
  String lastName;
  String firstName;

  List<String> preferences;
  List<String> allergies;

  User({
    required this.lastName,
    required this.firstName,
    required this.preferences,
    required this.allergies,
  });
  Map<String, dynamic> toJson() => {
        "lastName": lastName,
        "otherName": firstName,
        "preferences": preferences,
        "allergies": allergies,
      };
}
