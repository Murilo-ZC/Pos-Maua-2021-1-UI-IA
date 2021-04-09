class Usuario {
  List<Usuarios> usuarios;

  Usuario({this.usuarios});

  Usuario.fromJson(Map<String, dynamic> json) {
    if (json['usuarios'] != null) {
      usuarios = <Usuarios>[];
      json['usuarios'].forEach((v) {
        usuarios.add(new Usuarios.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.usuarios != null) {
      data['usuarios'] = this.usuarios.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Usuarios {
  int id;
  String nome;
  String email;
  int pass;

  Usuarios({this.id, this.nome, this.email, this.pass});

  Usuarios.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    pass = json['pass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['pass'] = this.pass;
    return data;
  }
}
