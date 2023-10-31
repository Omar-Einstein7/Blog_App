import 'package:blog_viewer_app/model/posts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../components/postwidget.dart';
import '../controller/API.dart';
import '../controller/theme.dart';
import '../utils/reducelenght.dart';


class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  APIController controller = Get.put(APIController());
  List<Posts> _users = <Posts>[];
  List<Posts> _usersDisplay = <Posts>[];
  bool _isLoading = true;

////////////////////////////////////////////////

  final ThemeProvider themeProvider = Get.put(ThemeProvider());
  final user= FirebaseAuth.instance.currentUser;
  String errorMessage = '';
   final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller.fetchBlogs().then((value) {
      setState(() {
        _isLoading = false;
        _users.addAll(value);
        _usersDisplay = _users;
        //print(_usersDisplay.length);
      });
    });
  }
void logout(){
 try{
   FirebaseAuth.instance.signOut();
   errorMessage = '';
 } on FirebaseAuthException catch (error) {
      errorMessage = error.message!;
    }
}
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Form(
        key: key,
        child: Scaffold(
          backgroundColor: themeProvider.themeMode().swithbgcolor,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: themeProvider.themeMode().AppBar,
             // actions: [
      
              //  IconButton(onPressed: logout, icon: Icon(Iconsax.logout)),
              //   Switch(
              //   value: themeProvider.isLightTheme.value,
              //   onChanged: (value) =>  themeProvider.toggleThemeData()   
              // ),
           //   ],
              title: Text("Blog Viewer App"),
              centerTitle: true,
            ),
            body: Column(
              children: [
                _searchBar(),
                Expanded(
                  child: _usersDisplay.length != 0
                  ? ListView.builder(
                    itemCount: _usersDisplay.length,
                    itemBuilder: (context , index){

                    String shortenedString = StringShortener.shortenString(_usersDisplay[index].body, 40);
                       return Postwidget(
                       original: _usersDisplay[index].body,
                        path: "assets/${_usersDisplay[index].userId}.jpg",
                              title: _usersDisplay[index].title,
                              body: shortenedString,
                              
                              
                                );
                    })
                  :Center( child: CircularProgressIndicator())
                ),
              ],
            ),
          
        ),
      );
    });
  }

  _searchBar() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: TextField(
        style: TextStyle(color:  themeProvider.themeMode().arrow),
        autofocus: false,
        onChanged: (searchText) {
          searchText = searchText.toLowerCase();
          setState(() {
            _usersDisplay = _users.where((u) {
              var fName = u.title.toLowerCase();
              var lName = u.body.toLowerCase();
              return fName.contains(searchText) || lName.contains(searchText);
            }).toList();
          });
        },
        decoration: InputDecoration(
   
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40)
          ),
          prefixIcon: Icon(Icons.search),
          
          labelText: "Search",
          labelStyle: TextStyle(color: themeProvider.themeMode().arrow),
        
        ),
      ),
    );
  }
}
