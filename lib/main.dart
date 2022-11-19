import 'package:flutter/material.dart';
import 'package:final_project/secondpage.dart';
import 'package:final_project/secondtriangle.dart';
import 'package:final_project/secondcircle.dart';
import 'package:final_project/secondrectangle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: finalproj());
  }
}

class finalproj extends StatefulWidget {
  const finalproj({Key? key}) : super(key: key);

  @override
  State<finalproj> createState() => _finalprojState();
}

class _finalprojState extends State<finalproj> {
  var items=[
    'Triangle','Square','Rectangle','Circle'
  ];
  var choice,x;
  @override
  Widget build(BuildContext context) {
    gototri(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>secondtri(choice: x)));
    }
    gotonextpage(){
      Navigator.push(context,MaterialPageRoute(builder: (context)=>secondpage(choice: x)));
    }
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
                DropdownButton(
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),onChanged: (String? newValue) {setState(() {x = newValue!;print(x);});},
                ),
                ElevatedButton(onPressed: gotonextpage, child: Text("Click to input values",style: TextStyle(
                    color: Colors.black,fontSize: 23,fontStyle: FontStyle.italic
                ),),style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.black),
                    backgroundColor: MaterialStatePropertyAll(Colors.white)
                ),)
              ],
            )
          ],
        )
    );
  }
}