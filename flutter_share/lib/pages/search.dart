import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/models/user.dart';
import 'package:flutter_share/pages/home.dart';
import 'package:flutter_share/widgets/progress.dart';
import 'package:flutter_svg/svg.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Future<QuerySnapshot> futureSearchResult;
  TextEditingController serachBar = TextEditingController();

  handleSearch(String val) {
    if (val.length > 0) {
      final Future<QuerySnapshot> users = usersCollectionRef
          .where(
            'displayName',
            isGreaterThanOrEqualTo: val,
          )
          .get();
      setState(() {
        futureSearchResult = users;
      });
    }
  }

  searchBarClear() {
    print("SearchBar clear called");
    serachBar.clear();
    setState(() {
      futureSearchResult = null;
    });
  }

  AppBar buildSearchBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: TextFormField(
          controller: serachBar,
          onFieldSubmitted: (val) => handleSearch(val),
          decoration: InputDecoration(
            filled: true,
            prefixIcon: Icon(Icons.search),
            hintText: "Search for a user...",
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: searchBarClear,
            ),
          ),
        ),
      ),
    );
  }

  Container buildNoContent() {
    final deviceHeight = MediaQuery.of(context).size.height;
    // MediaQuery.of(context).
    return Container(
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            SvgPicture.asset(
              'assets/images/search.svg',
              height: deviceHeight * 0.35,
            ),
            Text(
              "Find User",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }

  buildContent() {
    return FutureBuilder(
      future: futureSearchResult,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return circularProgress(context);
        }
        List<UserResult> searchResut = [];
        snapshot.data.docs.forEach((doc) {
          User user = User.fromDoc(doc);
          searchResut.add(UserResult(user));
        });
        return ListView(
          children: searchResut,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
      appBar: buildSearchBar(),
      body: futureSearchResult == null ? buildNoContent() : buildContent(),
    );
  }
}

class UserResult extends StatelessWidget {
  final User user;
  UserResult(this.user);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.7),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => print("tapped!"),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: CachedNetworkImageProvider(user.photoUrl),
              ),
              title: Text(
                user.displayName,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                user.username,
                style: TextStyle(color: Colors.white54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
