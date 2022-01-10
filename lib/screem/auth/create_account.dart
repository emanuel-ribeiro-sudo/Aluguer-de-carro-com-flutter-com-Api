import 'package:flutter/material.dart';
import 'package:rent_car/constants.dart';
import 'package:rent_car/screem/auth/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class CreateAccountPage  extends StatefulWidget {

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _biController= TextEditingController();

  final _nomeController= TextEditingController();

  final _morradaController= TextEditingController();

  final _telefoneController= TextEditingController();

  final _numeroCartaController= TextEditingController();

  final _emailController= TextEditingController();

  final _senhaController= TextEditingController();

  final _senha2Controller= TextEditingController();

  final _formkey = GlobalKey<FormState>();
  late Map _data;
  List _condutoresData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/1.jpg"), fit: BoxFit.cover,),
          ),
          height: MediaQuery.of(context).size.height,
          width:  MediaQuery.of(context).size.width,

        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start ,
              children: [
                Text("Create Account", style: Theme.of(context).textTheme.headline5!.
                copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Row(
                  children: [
                    const Text("Already have an account?",style: TextStyle(color: Colors.white)),
                    TextButton(onPressed: () => Navigator.push(context,MaterialPageRoute(
                        builder: (context)=>const LoginPage(),)
                    ),
                      child: const Text("Sign In",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              Form(
                key:_formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextFieldName(text:"BI",),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _biController,
                      validator: (bi){
                        if(bi==null || bi.isEmpty){
                        return 'Por favor, degite um numero Bi';
                        }else if(bi.length<6){
                        return 'Por favor, degite um numero Bi ,maior que 6 caracteres';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          hintText: "Ex:37803898",hintStyle: TextStyle(color: Colors.white)
                      ),
                    ),
                    const SizedBox(height: defaultPadding,),
                    const TextFieldName(text:"Numero Carta",),
                    TextFormField(
                      controller:_numeroCartaController,
                      validator: (numeroCarta){
                        if(numeroCarta==null || numeroCarta.isEmpty){
                          return 'Por favor, degite um numero Carta';
                        }else if(numeroCarta.length<5){
                          return 'Por favor, degite um numero carta ,maior que 6 caracteres';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          hintText: "Ex: S-1234",hintStyle: TextStyle(color: Colors.white)
                      ),
                    ),
                    const SizedBox(height: defaultPadding,),
                    const TextFieldName(text:"Email",),
                    TextFormField(
                      controller: _emailController,
                      validator: (email) {
                        if (email == null || email.isEmpty) {
                          return 'Por favor, degite seu email';
                        } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(_emailController.text)) {
                          return 'Por favor, digite um e-mail valido';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          hintText: "test@gmail.com",hintStyle: TextStyle(color: Colors.white)
                      ),
                    ),
                    const SizedBox(height: defaultPadding,),
                    const TextFieldName(text:"Telefone",),
                    TextFormField(
                      controller:_telefoneController,
                      validator: (telefone){
                        if(telefone==null || telefone.isEmpty){
                          return 'Por favor, degite um telefone';
                        }else if(telefone.length!=7 ){
                          return 'Por favor, degite um numero telefone com 7 caracteres';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          hintText: "+238 9887632",hintStyle: TextStyle(color: Colors.white)
                      ),
                    ),
                    const SizedBox(height: defaultPadding,),
                    const TextFieldName(text:"Nome",),
                    TextFormField(
                      controller: _nomeController,
                      validator: (nome){
                        if(nome==null || nome.isEmpty){
                          return 'Por favor, degite um nome';
                        }else if(nome.length<1){
                          return 'Por favor, degite um nome valido';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          hintText: "Ex: Jose Alves",hintStyle: TextStyle(color: Colors.white)
                      ),
                    ),
                    const SizedBox(height: defaultPadding,),
                    const TextFieldName(text:"Morada",),
                    TextFormField(
                      controller: _morradaController,
                      validator: (morrada){
                        if(morrada==null || morrada.isEmpty){
                          return 'Por favor, degite uma morrada';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          hintText: "Ex: Sao Felipe",hintStyle: TextStyle(color: Colors.white)
                      ),
                    ),
                    const SizedBox(height: defaultPadding,),
                    const TextFieldName(text:"Senha",),
                    TextFormField(
                      controller: _senhaController,
                      validator: (senha){
                        if(senha==null || senha.isEmpty){
                          return 'Por favor, degite uma senha';
                        }else if(senha.length<7){
                          return 'Por favor, degite uma senha ,maior que 6 caracteres';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "********",hintStyle: TextStyle(color: Colors.white)
                      ),
                    ),
                    const SizedBox(height: defaultPadding,),
                    const TextFieldName(text:"Confirm Password",),
                    TextFormField(
                      controller: _senha2Controller,
                      validator: (senha2){
                        if(senha2==null || senha2.isEmpty){
                          return 'Por favor, degite uma senha';
                        }else if(senha2.length<2){
                          return 'Por favor, degite uma senha ,maior que 6 caracteres';
                        }
                        return null;
                      },
                      // onEditingComplete: (){
                      //     if(_senhaController.text == _senha2Controller.text){
                      //       return null;
                      //     }else{
                      //       return 'Senhas nao correspondem';
                      //     }
                      // },

                      style: const TextStyle(color: Colors.white),
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "********",hintStyle: TextStyle(color: Colors.white)
                      ),
                    ),
                  ],
                )
            ),
                const SizedBox(height: defaultPadding *2,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed:  () async {
                    FocusScopeNode curentFocus = FocusScope.of(context);
                    if (_formkey.currentState!.validate()) {
                      bool temcarta = await getCarta(_biController.text,_numeroCartaController.text);
                      if(temcarta == true){
                        await createAccount(_biController.text,_nomeController.text,_morradaController.text,_telefoneController.text,_numeroCartaController.text,_emailController.text,_senhaController.text);
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(avisoSemcarta);
                      }
                      //createAccounte(_biController.text,_nomeController.text,_morradaController.text,_telefoneController.text,_numeroCartaController.text,_emailController.text,_senhaController.text);
                      if (!curentFocus.hasPrimaryFocus) {
                        curentFocus.unfocus();
                      }
                    }
                  },
                      // style: TextButton.styleFrom(backgroundColor: Colors.blue),
                      child: const Text("Sign Up")
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  final snackBar = const SnackBar(content: Text('Algo de errado nao esta certo',
    textAlign: TextAlign.center,),backgroundColor: remColor,);

  final avisoSemcarta = const SnackBar(content: Text('O numero de carta inserido nao existe',
    textAlign: TextAlign.center,),backgroundColor: remColor,);

  Future createAccount(String bilhte, String nome,String morrada, String telefone, String carta,String email,String senha) async{
    var url = Uri.parse('$BASE_URL/addusers');
    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:jsonEncode(<String, String>{
          "bi": bilhte,
          "nome": nome,
          "morrada": morrada,
          "telefone": telefone,
          "numero_carta": carta,
          "email": email,
          "senha": senha,
        })
    );
    if(response.statusCode == 200){
      // print(jsonDecode(response.body)['token']);
      // return true;
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=>const LoginPage()));
    }else{
      // print(jsonDecode(response.body));
      // return false;
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

   Future <bool> getCarta(String bi,String carta) async {
    var url = Uri.parse('$ApiDGTR/condutores/'+bi);
    http.Response response = await http.get(url);
    //  debugPrint(response.body);
    _data = jsonDecode(response.body);
    _condutoresData=_data['condutores'];
    if(_condutoresData[0]['numero_carta']==carta){
      return true;
    }else{
      return false;
    }
    // debugPrint("${_condutoresData[0]['numero_carta']}");
  }

}

class TextFieldName extends StatelessWidget {
  const TextFieldName({
    Key? key,required this.text
}):super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding/3),
      child: Text(text,
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white.withOpacity(0.5)),
      ),
    );
  }
}

