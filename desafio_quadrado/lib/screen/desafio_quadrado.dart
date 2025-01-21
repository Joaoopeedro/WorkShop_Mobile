import 'package:flutter/material.dart';

class DesafioQuadrado extends StatefulWidget {
  const DesafioQuadrado({super.key});

  @override
  State<DesafioQuadrado> createState() => _DesafioQuadradoState();
}

class _DesafioQuadradoState extends State<DesafioQuadrado> {
  double widthContainer = 200;
  double heightContainer = 200;

  void mudarParaRetangulo(){
    setState(() {
      widthContainer =400;
      heightContainer = 250;
    });
  }
  void mudarParaQuadrado(){
    setState(() {
      widthContainer =200;
      heightContainer = 200;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              width: widthContainer,
              height: heightContainer,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
              duration: const Duration(seconds: 1),
            ),
            const SizedBox(height: 100,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: ()=> mudarParaQuadrado(), child: const Text("Quadrado")),
                  SizedBox(
                    width: 40,
                  ),
                  ElevatedButton(onPressed: ()=> mudarParaRetangulo(), child: const Text("Retangulo")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}