import 'package:flutter/material.dart';
import 'package:final_project/secondpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: myHomePage());
  }
}

class myHomePage extends StatefulWidget {
  const myHomePage({Key? key}) : super(key: key);

  @override
  State<myHomePage> createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  var items=[
    'Triangle','Square','Rectangle','Trapezium','Circle'
  ];
  var choice,x;
  nextpage(){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>secondpage(choice: choice)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Area Calculator",style: TextStyle(
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
              Text("Please select your choice of figure",style: TextStyle(
                color: Colors.white,fontStyle: FontStyle.italic,fontSize: 23
              ),),
              DropdownButton(items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
                onChanged: choice=x,
                value: x,
              ),
              ElevatedButton(onPressed: nextpage(), child: Text("Click to input values",style: TextStyle(
                color: Colors.white,fontSize: 23,fontStyle: FontStyle.italic
              ),))
            ],
          )
        ],
      )
    );
  }
}
