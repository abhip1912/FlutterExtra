import 'package:demo_serializer/http_service.dart';
import 'package:demo_serializer/models/single_user_response.dart';
import 'package:demo_serializer/models/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'list_user_screen.dart';

class SingleUserScreen extends StatefulWidget {
  @override
  _SingleUserScreenState createState() => _SingleUserScreenState();
}

class _SingleUserScreenState extends State<SingleUserScreen> {
  HttpService httpServiceObj;
  SingleUserResponse singleUserResponse;
  User user;
  bool isLoading = false;

  Future getUser() async {
    Response resp;
    try {
      isLoading = true;
      resp = await httpServiceObj.getRequest('/api/users/3');
      isLoading = false;
      if (resp.statusCode == 200) {
        setState(() {
          singleUserResponse = SingleUserResponse.fromJson(resp.data);
          user = singleUserResponse.user;
        });
      } else {
        print("Something Wrong ! Status code is not 200!");
      }
    } on Exception catch (e) {
      isLoading = false;
      print(e);
    }
  }

  @override
  void initState() {
    httpServiceObj = HttpService();
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JsonSerializer"),
        centerTitle: true,
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : user != null
                ? Container(
                    child: Column(
                      children: [
                        Image.network(user.avatar),
                        SizedBox(height: 10),
                        Text("Hello ${user.firstName}"),
                      ],
                    ),
                  )
                : Center(
                    child: Text("No user obj !"),
                  ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => ListUserScreen())),
        child: Icon(
          Icons.chevron_right_rounded,
          size: 30,
        ),
      ),
    );
  }
}
