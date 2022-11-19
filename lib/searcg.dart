import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class jokes extends StatefulWidget {
  jokes({required this.term,this.x});
  var term,x;

  @override
  State<jokes> createState() => _jokesState();
}

class _jokesState extends State<jokes> {
  Future APIcall_city() async {
    final url = Uri.parse("https://icanhazdadjoke.com/slack");
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    var a=json['attachments'][0]['text'];
    print(json);
    return a;
  }

  @override
  Widget build(BuildContext context) {
    Future APIcall_city() async {
      final url = Uri.parse("https://icanhazdadjoke.com/search?term=${widget.term.toString()}");
      final response = await http.get(url);
      final json = jsonDecode(response.body);
      var a=json['results'][0]['joke'];
      print(json);
      return a;
    }
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
        title: Text("Joke generator",style: TextStyle(
        color: Colors.white,fontSize: 28,fontStyle: FontStyle.italic
    ),),
    centerTitle: true,),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Joke Generated!!!"),
                FutureBuilder(
                    future: APIcall_city(),
                    builder: (context,snapshot){
                      if(snapshot.hasData){
                        return Column(
                          children: [
                            Text(snapshot.data['results'][0]['joke'])
                          ],
                        );
                      }
                      else{
                        return CircularProgressIndicator();
                      }
                    }
                )
              ],)
        ],
      )
    );
  }
}
