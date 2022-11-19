import 'package:final_project/resultspage.dart';
import 'package:flutter/material.dart';

class secondpage extends StatefulWidget {
  secondpage({required this.choice});
  final choice;
  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
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
  Widget build(BuildContext context) {
    var a;
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
              TextField(controller:tcon,
                onChanged: (text1) {a=text1;},showCursor: true,style: TextStyle(
                  color: Colors.black,fontStyle: FontStyle.italic,fontSize: 25,),
                decoration: InputDecoration(hintText:"Enter side length",fillColor: Colors.white,filled: true),
              ),
              ElevatedButton(onPressed:
              gotoresults(rounding(double.parse(a)),0,0,widget.choice), child:
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