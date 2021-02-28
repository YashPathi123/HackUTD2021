import 'package:flutter/material.dart';


class Forum extends StatefulWidget {
  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  List<String> userInput = [];
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController universityName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.blue[600], Colors.blue[300]])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 70,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[ 
                    Text("Register Here", style: TextStyle(fontSize: 30)),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: firstName,
                  decoration: InputDecoration(
                    hintText: "First Name",
                    fillColor: Colors.grey[300].withOpacity(0.2),
                    filled: true, 
                    enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Colors.transparent, width: 1.0), 
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: lastName,
                  decoration: InputDecoration(
                    hintText: "Last Name",
                    fillColor: Colors.grey[300].withOpacity(0.2),
                    filled: true, 
                    enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Colors.transparent, width: 1.0), 
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: username,
                  decoration: InputDecoration(
                    hintText: "Enter Username",
                    fillColor: Colors.grey[300].withOpacity(0.2),
                    filled: true, 
                    enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Colors.transparent, width: 1.0), 
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    fillColor: Colors.grey[300].withOpacity(0.2),
                    filled: true, 
                    enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Colors.transparent, width: 1.0), 
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: universityName,
                  decoration: InputDecoration(
                    hintText: "University Name",
                    fillColor: Colors.grey[300].withOpacity(0.2),
                    filled: true, 
                    enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Colors.transparent, width: 1.0), 
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              SizedBox(
                height: 40,
                width: 300, // <-- Your width
                child:RaisedButton(
                  color: Colors.blue[700],
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                  onPressed: () {
                    userInput.add(firstName.text);
                    userInput.add(lastName.text);
                    userInput.add(username.text);
                    userInput.add(password.text);
                    userInput.add(universityName.text);
                    //send info to backend
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text('Sign Up', style: TextStyle(fontSize: 20)),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
