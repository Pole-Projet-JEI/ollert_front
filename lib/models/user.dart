import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {


  int ?id;
  String ?username;
  String ?email;
  User({
    this.id,
    this.username,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
  };




test(String a) async {
   if (a.endsWith('@jei-2021.tn')==true)
   {return(1);}
   else
     {return(0);}

  }

}