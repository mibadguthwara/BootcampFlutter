class UserModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }
}



// class UserModel {
//   final int id;
//   final String email;
//   final String firstName;
//   final String lastName;
//   final String avatar;

//   UserModel({
//     required this.id,
//     required this.email,
//     required this.firstName,
//     required this.lastName,
//     required this.avatar,
//   });

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return switch (json) {
//       {
//         'id': int id,
//         'email': String email,
//         'firstName': String firstName,
//         'lastName': String lastName,
//         'avatar': String avatar,
//       } =>
//         UserModel(
//           id: id,
//           email: email,
//           firstName: firstName,
//           lastName: lastName,
//           avatar: avatar,
//         ),
//       _ => throw const FormatException('Failed to load Post'),
//     };
//   }
// }
