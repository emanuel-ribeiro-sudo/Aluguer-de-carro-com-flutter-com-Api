class Cliente{
  String _nome, _morada, _telefone,_utilizador,_senha,_cargo;
  int _bi, _numero_carta;
  Cliente(this._bi,this._nome,this._morada,this._numero_carta,this._cargo,
      this._senha,this._telefone,this._utilizador);
  factory Cliente.fromJSON(Map<String,dynamic> json){
    if(json==null){
      return Cliente(json["bi"], json["nome"], json["morada"], json["numero_carta"], json["cargo"], json["senha"],json["telefone"], json["utilizador"]);;
    }else{
      return Cliente(json["bi"], json["nome"], json["morada"], json["numero_carta"], json["cargo"], json["senha"],json["telefone"], json["utilizador"]);
    }
  }
  get bi => this._bi;
  get nome => this._nome;
  get telefone => this._telefone;
  get morada => this._morada;
  get senha => this._senha;
  get numero_carta => this._numero_carta;
  get utilizador => this._utilizador;
  get cargo => this._cargo;


}