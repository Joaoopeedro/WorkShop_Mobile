import 'package:desafio1/screen2.dart';
import 'package:flutter/material.dart';

class ScreenDesafio1 extends StatefulWidget {
  double? saldoBancario;
  ScreenDesafio1({super.key, this.saldoBancario});

  @override
  State<ScreenDesafio1> createState() => _ScreenDesafio1State();
}

class _ScreenDesafio1State extends State<ScreenDesafio1> {
  double widthContainer = 50;
  double heightContainer = 50;

  void aumentarContainer(){
    setState(() {
      widthContainer =200;
      heightContainer=200;
    });
  }

  void diminuirContainer(){
    setState(() {
      widthContainer = 50;
      heightContainer = 50;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Desafio1",style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: AssetImage("assets/bmw.jpeg"),fit: BoxFit.cover)
              ),
            ),
            const SizedBox(height: 30,),
            AnimatedContainer(
              duration: const Duration(seconds: 1 ),
              curve: Curves.elasticInOut,
              width: widthContainer,
              height: heightContainer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.purple
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: ()=> aumentarContainer(), child: Icon(Icons.add)),
                const SizedBox(width: 10,),
                ElevatedButton(onPressed: ()=> diminuirContainer(), child: Icon(Icons.remove)),
              ],
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> const Screen2()));
            }, child: Text("Passar pra outra tela"))
            
            
          ],
        ),
      ),
    );
  }
}