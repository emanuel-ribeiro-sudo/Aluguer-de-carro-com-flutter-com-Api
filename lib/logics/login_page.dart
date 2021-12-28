class Login {
  Login({
    required this.email,
    required this.senha,
    required this.logado,
  });
  late final String email;
  late final String senha;
  late final bool logado;

  Login.fromJson(Map<String, dynamic> json){
    email = json['email'];
    senha = json['senha'];
    logado = json['logado'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['senha'] = senha;
    _data['logado'] = logado;
    return _data;
  }
}

