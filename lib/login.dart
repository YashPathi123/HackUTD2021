import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<String> userInput = [];
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

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
                height: 40,
              ),
              Center(
                child: Image.asset('assets/logofinal.png'),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: username,
                  decoration: InputDecoration(
                    hintText: "Username",
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
                    hintText: "Password",
                    fillColor: Colors.grey[300].withOpacity(0.2),
                    filled: true, 
                    enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                height: 40,
                width: 300, // <-- Your width
                child:RaisedButton(
                  color: Colors.blue[700],
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                  onPressed: () {
                    userInput.add(username.text);
                    userInput.add(password.text);
                    Navigator.pushNamed(context, '/home', arguments: userInput);
                  },
                  child: Text('Log in', style: TextStyle(fontSize: 20)),
                  ),
                ),
              SizedBox(height: 70.0),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[ 
                    Text("Don't have an account?"),
                    TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forum', arguments: userInput);
                    },
                    child: Text('Sign Up'),
                    ),
                  ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}