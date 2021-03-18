class Usuario{
  String nome;
  String email;
  String telefone;


  Usuario(this.nome, this.email, this.telefone);

  @override
  String toString() {
    return 'Usuario{nome: $nome, email: $email, telefone: $telefone}';
  }
}