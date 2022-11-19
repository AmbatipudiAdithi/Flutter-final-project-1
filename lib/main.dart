import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:final_project/jokepage.dart';
import 'package:final_project/searcg.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: finalproj(),
    debugShowCheckedModeBanner:false );
  }
}

class finalproj extends StatefulWidget {
  const finalproj({Key? key}) : super(key: key);

  @override
  State<finalproj> createState() => _finalprojState();
}
Future APIcall_city() async {
  final url = Uri.parse("https://icanhazdadjoke.com/slack");
  final response = await http.get(url);
  final json = jsonDecode(response.body);
  var a=json['attachments'][0]['text'];
  print(json);
  return a;
}

class _finalprojState extends State<finalproj> {
  @override
  Widget build(BuildContext context) {
    final _citycon1=TextEditingController();
    var x;
    sendit(){
      var a;
      a=APIcall_city();
      Navigator.push(context,MaterialPageRoute(builder: (context)=>jokepage(x:a)));
    }
    senditnew(){
      var a;
      a=APIcall_city();
      Navigator.push(context,MaterialPageRoute(builder: (context)=>jokes(term: x,x:a)));
    }
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Joke generator",style: TextStyle(
              color: Colors.white,fontSize: 28,fontStyle: FontStyle.italic
          ),),
          centerTitle: true,
        ),
        body:Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: sendit, child: Text("Get a random joke")),
                Container(height:46,width:250,child:
                TextField(controller: _citycon1,
                  onChanged: (text) {x=text;},showCursor: true,style: TextStyle(
                    color: Colors.black,fontStyle: FontStyle.italic,fontSize: 25,
                  ),decoration: InputDecoration(hintText:"Enter search term:",fillColor: Colors.white,filled: true),
                ),),
                ElevatedButton(onPressed: senditnew, child: Text("Search for joke"))
              ],
            )],
        )
    );
  }
}