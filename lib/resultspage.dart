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
    results(){
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
      }
    }
    return Scaffold(
      
    );
  }
}
