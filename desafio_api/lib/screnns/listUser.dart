import 'dart:convert';

import 'package:desafio_api/models/userApi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Listuser extends StatefulWidget {
  const Listuser({super.key});

  @override
  State<Listuser> createState() => _ListuserState();
}

class _ListuserState extends State<Listuser> {
  List<User> listUser = [];
  List<User> listUserFilter = [];
  String pesquisar = "";

  Future<void> getUser()async{
    var response = await http.get(Uri.parse("https://6790439f49875e5a1a94bd0d.mockapi.io/Users"),
      headers: {
        "Content-Type":"application/json"
      }
    );
    if(response.statusCode == 200){
      setState(() {
        var jsonData = jsonDecode(response.body);
        jsonData.forEach((item)=> listUser.add(User.fromJson(item)));
        listUserFilter = listUser;
      });
    }else{
      var snackBar =const SnackBar(content: Text("Erro ao tentar consumir!"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void deleteUser(String? idUser,int index)async{
    var response = await http.delete(Uri.parse("https://6790439f49875e5a1a94bd0d.mockapi.io/Users/$idUser"),
      headers: {
        "Content-Type":"application/json"
      }
    );
    if(response.statusCode == 200){
      var snackBar = SnackBar(content: Text("Usuário excluido com sucesso!"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
      setState(() {
      listUser.removeAt(index);
      });

    }else{
      var snackBar = SnackBar(content: Text("Erro ao excluir!"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Usuários"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 300,
                      height: 45,
                      child: TextFormField(
                        onChanged: (text){
                          setState(() {
                            pesquisar = text;
                            listUser = listUserFilter.where((e)=> e.name!.toLowerCase().contains(pesquisar.toLowerCase())).toList();
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                          ),
                          label: Text("Pesquisar...")
                        ),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    ElevatedButton(onPressed: (){}, child: const Icon(Icons.add)),
                    
                  ],
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  child: ListView.builder(
                    itemCount: listUser.length, 
                    itemBuilder: (BuildContext context, int index) { 
                      return GestureDetector(
                        onLongPress: (){
                          showGeneralDialog(
                            context: context, 
                            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) { 
                                return Center(
                                  child: Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white
                                  ),
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                        const DefaultTextStyle(style: TextStyle(color: Colors.black,fontSize: 25), child: Text("Ações")),
                                        IconButton(onPressed: (){
                                          Navigator.pop(context);
                                        }, icon: const Icon(Icons.close))
                                        ],
                                      ),
                                      const SizedBox(height: 20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: ()=> deleteUser(listUser[index].id,index),
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.red.withOpacity(0.3),
                                                shape: BoxShape.circle
                                              ),
                                              alignment: Alignment.center,
                                              child: const Icon(Icons.delete,color: Colors.red,size: 35,),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: (){},
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.yellow.withOpacity(0.3),
                                                shape: BoxShape.circle
                                              ),
                                              alignment: Alignment.center,
                                              child: const Icon(Icons.edit,color: Colors.yellow,size: 35,),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                );
                             },
                            
                          );
                        },
                        child: ListTile(
                          title: Text(listUser[index].name!),
                          subtitle: Text("${listUser[index].profissao!} - ${listUser[index].idade}"),
                        ),
                      );
                     },
                    
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}