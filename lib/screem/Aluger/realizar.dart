

import 'package:flutter/material.dart';
import 'package:rent_car/screem/Componentes/Automoveis/automoveis_page.dart';
import '../../constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Realizar_Aluguer extends StatefulWidget {

  Realizar_Aluguer({Key? key, this.matricula, this.precototal}) : super(key: key);
  final matricula;

  final precototal;

  @override
  State<Realizar_Aluguer> createState() => _Realizar_AluguerState();
}

class _Realizar_AluguerState extends State<Realizar_Aluguer> {

  SharedPreferences guardabi =  SharedPreferences.getInstance() as SharedPreferences;
  final _matriculaController = TextEditingController();

  late final cliente=guardabi.getString('bi');

  final _precoController = TextEditingController();

  final _tempoController = TextEditingController();

  final _dataController= TextEditingController();

  bool estadoAluguer = true;
  // Future<bool > verificarBi() async{
  //   SharedPreferences guardabi = await SharedPreferences.getInstance();
  //   if(guardabi.getString('bi')== null){
  //     return false;
  //   }else{
  //     cliente = guardabi.getString('bi');
  //     return true;
  //   }
  // }
  // @override
  // void initState(){
  //   super.initState();
  //   verificarBi().then((value){
  //     if(!value){
  //
  //     }else{
  //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:SizedBox(
          height: MediaQuery.of(context).size.height,
          width:  MediaQuery.of(context).size.width,
          child: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
               // image: DecorationImage(image: AssetImage("assets/1.jpg"), fit: BoxFit.cover,),
              ),
              height: MediaQuery.of(context).size.height,
              width:  MediaQuery.of(context).size.width,

              child: SafeArea(
                child:  SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start ,
                    children: [
                      const SizedBox(height: defaultPadding *4,),
                      Text("Alugar", style: Theme.of(context).textTheme.headline5!.
                      copyWith(fontWeight: FontWeight.bold, color: bgColor),
                      ),
                  Form(

                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                const SizedBox(height: defaultPadding,),
                const TextFieldNameRealizarAlu(text:"Automovel",),
                TextFormField(
                  // controller: _matriculaController,
                  initialValue: widget.matricula,
                  enabled: false,
                  style: const TextStyle(color: bgColor),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    // hintText: "ST-12-IO",hintStyle: TextStyle(color: bgColor)
                  ),
                ),
                const SizedBox(height: defaultPadding,),
                const TextFieldNameRealizarAlu(text:"Cliente",),
                TextFormField(
                  initialValue: cliente,
                  enabled: false,
                  style: const TextStyle(color: bgColor),
                  decoration: const InputDecoration(
                    // hintText: "Jose Almeida",hintStyle: TextStyle(color: bgColor)
                  ),
                ),
                const SizedBox(height: defaultPadding,),
                const TextFieldNameRealizarAlu(text:"Data Inicio",),
                TextFormField(
                  controller: _dataController,
                   keyboardType: TextInputType.datetime,
                  // onTap: () async {
                  //   await showDatePicker(
                  //     context: context,
                  //     initialDate: DateTime.now(),
                  //     firstDate: DateTime.now(),
                  //     lastDate: DateTime(2025),
                  //   ).then((selectedDate) {
                  //     if (selectedDate != null) {
                  //       _dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
                  //     }
                  //   });
                  // },
                  style: const TextStyle(color: bgColor),
                  decoration: const InputDecoration(
                      hintText: "12/12/21",hintStyle: TextStyle(color: bgColor)
                  ),
                ),
                const SizedBox(height: defaultPadding,),
                const TextFieldNameRealizarAlu(text:"Tempo",),
                TextFormField(
                  controller: _tempoController,
                  // onChanged:  x = setPreco(int.parse(_tempoController.text), precototal),
                  style: const TextStyle(color: bgColor),
                  decoration: const InputDecoration(
                      hintText: "4",hintStyle: TextStyle(color: bgColor)
                  ),
                ),
                const SizedBox(height: defaultPadding,),
                const TextFieldNameRealizarAlu(text:"Total a pagar",),
                TextFormField(
                  controller:_precoController,
                  enabled: false,
                  style: const TextStyle(color: bgColor),
                  decoration: const InputDecoration(
                    // hintText: "6000 CVE",hintStyle: TextStyle(color: bgColor)
                  ),
                ),
                const SizedBox(height: defaultPadding,),
                ],
              )
            ),

                      const SizedBox(height: defaultPadding,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed:  (){
                          realizarAluguer(cliente.toString(), widget.matricula, _dataController.text, _tempoController.text, _precoController.text, estadoAluguer.toString());
                        },
                            child: const Text("Confirmar")
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }

  final snackBar = const SnackBar(content: Text('tem bi',
    textAlign: TextAlign.center,),backgroundColor: Colors.green,);

  Future realizarAluguer(String bi,String carro, String data, String tempo,String preco,String estado) async{
    var url = Uri.parse('$BASE_URL/users/'+bi+'/alguers');
    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:jsonEncode(<String, String>{
          "matricula":widget.matricula,
          "data_inicio":data,
          "tempo":tempo,
          "preco_total":preco,
          "estado":estado
        })
    );
    if(response.statusCode == 200){
      // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Automoveis_page()));
    }else{
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

class TextFieldNameRealizarAlu extends StatelessWidget {
  const TextFieldNameRealizarAlu({
    Key? key,required this.text
  }):super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding/3),
      child: Text(text,
        style: TextStyle(fontWeight: FontWeight.w600, color: bgColor.withOpacity(0.5)),
      ),
    );
  }
}
