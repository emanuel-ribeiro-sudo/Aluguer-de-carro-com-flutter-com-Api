class CreateAccount {
  CreateAccount({
    required this.bi,
    required this.nome,
    required this.morrada,
    required this.telefone,
    required this.numeroCarta,
    required this.cargo,
    required this.email,
    required this.senha,
    required this.logado,
  });
  late final String bi;
  late final String nome;
  late final String morrada;
  late final String telefone;
  late final String numeroCarta;
  late final String cargo;
  late final String email;
  late final String senha;
  late final bool logado;

  CreateAccount.fromJson(Map<String, dynamic> json){
    bi = json['bi'];
    nome = json['nome'];
    morrada = json['morrada'];
    telefone = json['telefone'];
    numeroCarta = json['numero_carta'];
    cargo = json['cargo'];
    email = json['email'];
    senha = json['senha'];
    logado = json['logado'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['bi'] = bi;
    _data['nome'] = nome;
    _data['morrada'] = morrada;
    _data['telefone'] = telefone;
    _data['numero_carta'] = numeroCarta;
    _data['cargo'] = cargo;
    _data['email'] = email;
    _data['senha'] = senha;
    _data['logado'] = logado;
    return _data;
  }
}