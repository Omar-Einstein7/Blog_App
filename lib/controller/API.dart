import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/posts.dart';

class APIController extends GetxController{

String url = "https://jsonplaceholder.typicode.com/posts";


List<Posts> parseBlog(String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  var blogs = list.map((e) => Posts.fromJson(e)).toList();
  return blogs;
}

Future<List<Posts>> fetchBlogs() async{
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return compute(parseBlog,response.body);
  } else {
    throw Exception(response.statusCode);
  }
}
}