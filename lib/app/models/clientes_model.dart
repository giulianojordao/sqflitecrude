class Cliente {
  Cliente(
      {this.id_cliente,
      this.nome_cliente,
      this.email_cliente,
      this.celular_cliente,
      this.senha_cliente,
      this.status_cliente,
      this.dta_cadastro});

  factory Cliente.fromJson(Map<String, dynamic> data) => new Cliente(
      id_cliente: data["id_cliente"] as int,
      nome_cliente: data["nome_cliente"] as String,
      email_cliente: data["email_cliente"] as String,
      senha_cliente: data["senha_cliente"] as String,
      status_cliente: data["status_cliente"] as int,
      dta_cadastro: data["dta_cadastro"] as String);

  int? id_cliente;
  String? nome_cliente;
  String? email_cliente;
  String? celular_cliente;
  String? senha_cliente;
  int? status_cliente;
  String? dta_cadastro;

  Map<String, dynamic> toJson() => {
        "id_cliente": id_cliente,
        "nome_cliente": nome_cliente,
        "email_cliente": email_cliente,
        "celular_cliente": celular_cliente,
        "senha_cliente": senha_cliente,
        "status_cliente": status_cliente,
        "dta_cadastro": dta_cadastro
      };

  int? get idCliente => id_cliente;
  String? get emailCliente => email_cliente;
}
