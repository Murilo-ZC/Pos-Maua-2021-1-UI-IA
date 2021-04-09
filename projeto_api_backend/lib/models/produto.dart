class Produto {
  List<Produtos> produtos;

  Produto({this.produtos}) {
    if (this.produtos == null) this.produtos = [];
  }

  Produto.fromJson(Map<String, dynamic> json) {
    if (json['produtos'] != null) {
      produtos = <Produtos>[];
      json['produtos'].forEach((v) {
        produtos.add(new Produtos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.produtos != null) {
      data['produtos'] = this.produtos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Produtos {
  int id;
  String nome;
  double preco;
  int quantidade;

  Produtos(this.id, this.nome, this.preco, this.quantidade);

  Produtos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    preco = json['preco'];
    quantidade = json['quantidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['preco'] = this.preco;
    data['quantidade'] = this.quantidade;
    return data;
  }
}
