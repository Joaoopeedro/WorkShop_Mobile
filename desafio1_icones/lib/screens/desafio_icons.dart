import 'package:flutter/material.dart';

class DesafioIcons extends StatefulWidget {
  const DesafioIcons({super.key});

  @override
  State<DesafioIcons> createState() => _DesafioIconsState();
}

class _DesafioIconsState extends State<DesafioIcons> {
  Icon iconScreen = const Icon(Icons.home,size: 100,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconScreen,
            const SizedBox(height: 30,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      iconScreen = const Icon(Icons.home);
                    });
                  }, child: const Icon(Icons.home)),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      iconScreen = const Icon(Icons.verified_user);
                    });
                  }, child: const Icon(Icons.verified_user)),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      iconScreen = const Icon(Icons.access_alarm);
                    });
                  }, child: const Icon(Icons.access_alarm)),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      iconScreen = const Icon(Icons.arrow_back_rounded);
                    });
                  }, child: const Icon(Icons.arrow_back_rounded)),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}