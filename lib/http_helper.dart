import 'dart:convert';
import 'dart:io';

import 'package:firstmonie/pages/home/models/posts_response_model.dart';
import 'package:http/http.dart' as http;

class HTTPHelper {
  final _client = http.Client();
  Map<String, String> header() {
    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
    };
    return headers;
  }

  Future<List<PostsResponseModel>> getPosts() async {
    final response = await _client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: header(),
    );
    final json = jsonDecode(response.body) as List<dynamic>;
    final posts = json.map(
      (e) => PostsResponseModel.fromMap(
        Map<String, dynamic>.from(e as Map<String, dynamic>),
      ),
    );
    return posts.toList();
  }

  //--fetching all items
  Future<List<Map>> fetchItems() async {
    List<Map> items = [];

    //--get the data from the API
    http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      String jsonString = response.body;
      //--convert to List<Map>
      items = jsonDecode(jsonString);
    }

    return items;
  }

  //--fetch details of one item
  Future<Map> getItem(itemId) async {
    Map item = {};

    //get the item from the API
    http.Response response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$itemId'));

    if (response.statusCode == 200) {
      String jsonString = response.body;
      //--convert to List<Map>
      item = jsonDecode(jsonString);
    }
    return item;
  }

  //--add new item
  Future<bool> addItem(Map data) async {
    bool status = false;

    //Add the item to database, call the API
    http.Response response = await http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        body: jsonEncode(data),
        headers: {'Content-type': 'application/json'});
    if (response.statusCode == 200) {
      status = response.body.isNotEmpty;
    }

    return status;
  }

//--update an item
  Future<bool> updateItem(Map data, String itemId) async {
    bool status = false;

    //update the item, call the API
    http.Response response = await http.put(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/$itemId'),
        body: jsonEncode(data),
        headers: {'Content-type': 'application/json'});
    if (response.statusCode == 200) {
      status = response.body.isNotEmpty;
    }
    return status;
  }
//--delete an item

  Future<bool> deleteItem(String itemId) async {
    bool status = false;

    //delete the item from the database
    http.Response response = await http.delete(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/$itemId'));

    if (response.statusCode == 200) {
      status = true;
    }
    return status;
  }
}
