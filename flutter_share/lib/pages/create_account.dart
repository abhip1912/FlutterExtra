import 'package:flutter/material.dart';
import 'package:flutter_share/pages/home.dart';
import 'package:flutter_share/widgets/header.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  String userName;

  submitUsername() {
    final createUserNameForm = _formKey.currentState;
    final bool isValid = createUserNameForm.validate();
    if (isValid) {
      createUserNameForm.save();
      final SnackBar snackBar = SnackBar(content: Text("Welcome $userName"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) => Home(),
        ),
        result: userName,
      );
    }
  }

  @override
  Widget build(BuildContext parentContext) {
    final GoogleSignInAccount user = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: header(
        context,
        myTitle: "Hello " + user.displayName,
        myFontFamily: "",
        myFontSize: 20.0,
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Center(
                child: Text(
                  "Create a username",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: _formKey,
                  child: TextFormField(
                    validator: (value) {
                      if (value.trim().length < 3 || value == null) {
                        return "username too short!";
                      } else if (value.trim().length > 12) {
                        return "username is too big";
                      }
                      return null;
                    },
                    onSaved: (val) => userName = val,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "UserName",
                        labelStyle: TextStyle(fontSize: 15.0),
                        hintText: "Must be atleast 3 charachters !"),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: submitUsername,
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(7.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
