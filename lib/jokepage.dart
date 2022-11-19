import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class jokepage extends StatefulWidget {
  jokepage({required this.x});
  var x;
  @override
  State<jokepage> createState() => _jokepageState();
}

class _jokepageState extends State<jokepage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
        title: Text("Joke generator",style: TextStyle(
        color: Colors.white,fontSize: 28,fontStyle: FontStyle.italic
        ),),
          centerTitle: true,),
        body:Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Randomly Generated Joke",style: TextStyle(
                    color: Colors.white,fontSize: 28,fontStyle: FontStyle.italic
                ),),
                FutureBuilder(
                    future: APIcall_city(),
                    builder: (context,snapshot){
                      if(snapshot.hasData) {
                        return Column(
                          children: [
                            Text(snapshot.data,
                            style: TextStyle(
                              color: Colors.white
                            ),)
                          ],
                        );
                      }
                      else{return CircularProgressIndicator();}
                    }
                )
              ],
            )
          ],
        )
    );
  }
}


Future APIcall_city() async {
  final url = Uri.parse("https://icanhazdadjoke.com/slack");
  final response = await http.get(url);
  final json = jsonDecode(response.body);
  var a=json['attachments'][0]['text'];
  print(json);
  return a;
}