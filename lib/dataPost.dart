import 'package:http/http.dart';
import 'dart:convert';

class Post {
  String username;
  String description;
  String urgency;
  String fname;
  String lname;
  String reply;
  String title;
  String test;
  String id;

  Post({
    this.urgency,
    this.description,
    this.id,
    this.fname,
    this.lname,
    this.username,
    this.reply,
    this.test,
  });

  Future<void> getdata() async {
    // make the request
    Response response =
        await get('http://1ae63a08b0ab.ngrok.io/postsGetDes/id');

    String jsonsDataString = response.body.toString();
    Map data = jsonDecode(jsonsDataString);
    print(data.toString());

    description = data['description'];
    urgency = data['priority'];
    reply = data['replies'];
    username = data['username'];

    // if (json.decode(response.body) == "User does not exist") {
    //   print("wrong email");
    // } else {
    //   Map data = json.decode(response.body);
    //   print(data.toString());
    //   description = data['description'];
    //   urgency = data['priority'];
    //   reply = data['replies'];
    //   username = data['username'];
    // }

    // Response response2 = await get(
    //     'http://1ae63a08b0ab.ngrok.io/user/$username'); //send to user db
    // Map name = jsonDecode(response2.body);
    // print(name.toString());
    // fname = name['firstname'];
    // lname = name['lastname'];
  }
}
