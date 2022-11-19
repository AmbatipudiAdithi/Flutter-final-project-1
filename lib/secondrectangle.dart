import 'package:final_project/resultspage.dart';
import 'package:flutter/material.dart';

class secondrect extends StatefulWidget {
  secondrect({required this.choice});
  final choice;
  @override
  State<secondrect> createState() => _secondrectState();
}

class _secondrectState extends State<secondrect> {
  rounding(x){
    x=x*100;
    x=x.roundToDouble();
    x=x/100;
    return x;
  }
  final tcon=TextEditingController();
  final tcon1=TextEditingController();
  final tcon2=TextEditingController();
  gotoresults(a,b,c,d){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>resultspage(
        a: a,b: b,c: c,d: d
    )));
  }
  @override
  var b,c;
  Widget build(BuildContext context) {
    var x=widget.choice;
    return Scaffold(
      appBar: AppBar(
        title: Text("Area Calculator",style: TextStyle(
            color: Colors.white,fontSize: 28,fontStyle: FontStyle.italic
        ),),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller:tcon1,
                onChanged: (text1) {c=text1;},showCursor: true,style: TextStyle(
                  color: Colors.black,fontStyle: FontStyle.italic,fontSize: 25,),
                decoration: InputDecoration(hintText:"Enter length",fillColor: Colors.white,filled: true),
              ),
              TextField(controller:tcon2,
                onChanged: (text1) {b=text1;},showCursor: true,style: TextStyle(
                  color: Colors.black,fontStyle: FontStyle.italic,fontSize: 25,),
                decoration: InputDecoration(hintText:"Enter breadth",fillColor: Colors.white,filled: true),
              ),
              ElevatedButton(onPressed: gotoresults(rounding(double.parse(b)),rounding(double.parse(c)),0,widget.choice), child:
              Text("Go to Results",style: TextStyle(
                  color: Colors.black,fontStyle: FontStyle.italic,fontSize: 24
              ),),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),)
            ],
          )
        ],
      ),
    );
  }
}