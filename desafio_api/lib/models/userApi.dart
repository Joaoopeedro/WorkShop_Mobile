class User{
  String? id;
  String? name;
  String? profissao;
  int? idade;

  User({this.id,this.name,this.profissao,this.idade});

  User.fromJson(Map<String, dynamic> json){
    id = json["id"];
    name = json["name"];
    profissao = json["profissao"];
    idade = json["idade"];
  }
}