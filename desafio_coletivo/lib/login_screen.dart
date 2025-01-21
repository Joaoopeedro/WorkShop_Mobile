import 'package:desafio_coletivo/boasVindas.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool verSenha = true;
  String email = "";
  String senha = "";

  void visualizarSenha(){
    setState(() {
      verSenha = !verSenha;
    });
  }

  void logar(){
    if(email == "joao@senai.com" && senha == "1234"){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> const Boasvindas()));
    }else{
      var snackBar = const SnackBar(content: Text("Dados incorretos!!"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Color(0xffffffff)
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/logo_senai.jpeg"))
                ),
              ),
              const SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: TextFormField(
                  onChanged: (text){
                    setState(() {
                      email = text;
                    });
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: const Text("E-mail")
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: TextFormField(
                  obscureText: verSenha,
                  onChanged: (text){
                    setState(() {
                      senha = text;
                    });
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(onPressed: ()=> visualizarSenha(), icon: verSenha ? const Icon(FontAwesomeIcons.eye) : const Icon(FontAwesomeIcons.eyeSlash)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: const Text("Senha")
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  child: ElevatedButton(onPressed: (){
                    logar();
                  }, child: Text("Entrar")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}