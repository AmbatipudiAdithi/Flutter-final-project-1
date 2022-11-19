import 'dart:math';

import 'package:flutter/material.dart';

class resultspage extends StatefulWidget {
  resultspage({required this.a,this.b,this.c,this.d});
  var b;
  var c;
  var d;
  var a;
  @override
  State<resultspage> createState() => _resultspageState();
}

class _resultspageState extends State<resultspage> {
  @override
  Widget build(BuildContext context) {
    var choice=widget.d;
    var a,p;
    if (choice=='Square'){
    a=widget.a*widget.a;
    p=4*widget.a;
    }else if (choice=='Rectangle'){
    a=widget.a*widget.b;
    p=2*(widget.a+widget.b);
    }else if (choice=='Triangle'){
    p=widget.a+widget.b+widget.c;
    var s=(p/2)*100.roundToDouble()/100;
    var x=s*(s-widget.a)*(widget.b)*(widget.c);
    a=pow(x, 0.5);
    }else if (choice=='Circle'){
    var pi=3.14;
    a=pi*widget.a*widget.a;
    p=pi*2*widget.a;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("Area Calculator",style: TextStyle(
              color: Colors.white,fontSize: 28,fontStyle: FontStyle.italic
          ),),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body:Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Area: "+a.toString(),style: TextStyle(
                    color: Colors.black,fontStyle: FontStyle.italic,fontSize: 24
                )),
                Text("Perimeter: "+p.toString(),style: TextStyle(
                    color: Colors.black,fontStyle: FontStyle.italic,fontSize: 24
                ))
              ],
            )
          ],
        )
    );
  }
}
