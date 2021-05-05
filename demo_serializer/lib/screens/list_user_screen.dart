import 'package:demo_serializer/http_service.dart';
import 'package:demo_serializer/models/list_user_response.dart';
import 'package:demo_serializer/models/single_user_response.dart';
import 'package:demo_serializer/models/user.dart';
import 'package:demo_serializer/screens/single_user_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ListUserScreen extends StatefulWidget {
  @override
  _ListUserScreenState createState() => _ListUserScreenState();
}

class _ListUserScreenState extends State<ListUserScreen> {
  HttpService httpServiceObj;
  ListUserResponse listUserResponse;
  List<User> usersList;
  int pageNo;
  int perPage;
  int total;
  int totalPages;
  bool isLoading = false;

  Future getUserList() async {
    Response resp;
    try {
      isLoading = true;
      resp = await httpServiceObj.getRequest('/api/users?page=2');
      isLoading = false;
      if (resp.statusCode == 200) {
        setState(() {
          listUserResponse = ListUserResponse.fromJson(resp.data);
          usersList = listUserResponse.usersList;
          pageNo = listUserResponse.pageNo;
          perPage = listUserResponse.perPage;
          total = listUserResponse.total;
          totalPages = listUserResponse.totalPages;
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
    getUserList();
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
            : usersList != null
                ? ListView.builder(
                    itemCount: usersList.length,
                    itemBuilder: (context, index) => Container(
                      child: Column(
                        children: [
                          Image.network(usersList[index].avatar),
                          SizedBox(height: 10),
                          Text("Hello ${usersList[index].firstName}"),
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: Text("No user obj !"),
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => SingleUserScreen())),
        child: Icon(
          Icons.chevron_left_rounded,
          size: 30,
        ),
      ),
    );
  }
}
