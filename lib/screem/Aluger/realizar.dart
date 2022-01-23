import 'package:flutter/material.dart';
import 'package:rent_car/screem/cliente/clientes.dart';
import '../../constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class Realizar_Aluguer extends StatefulWidget {

  Realizar_Aluguer({Key? key, this.matricula, this.precototal}) : super(key: key);
  final matricula;

  final precototal;

  @override
  State<Realizar_Aluguer> createState() => _Realizar_AluguerState();
}

class _Realizar_AluguerState extends State<Realizar_Aluguer> {


  //final _matriculaController = TextEditingController();
  String valorPagar = '';
  var cliente;
  var resultado;
  final _precoController = TextEditingController();

  final _tempoController = TextEditingController();

  final _dataController= TextEditingController();

  var _dateTime;

  bool estadoAluguer = true;

  final _formkey = GlobalKey<FormState>();

   double mult(a,b){
     return a*b;
   }
  // verificarBi() async{
  //   SharedPreferences guardabi = await SharedPreferences.getInstance();
  //   if(guardabi.getString('bi')== null){
  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //   }else{
  //     setState(() {
  //       cliente = guardabi.getString('bi').toString();
  //       print(cliente);
  //     });
  //   }
  // }

  @override
  void initState(){
    super.initState();
    // verificarBi();
    setState(() {
    SharedPreferences.getInstance().then((value) =>{
        cliente= value.getString('bi').toString(),
    });
    });
  }

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
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding,vertical:
                      defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start ,
                    children: [
                      const SizedBox(height: defaultPadding *4,),
                      Text("Alugar", style: Theme.of(context).textTheme.headline5!.
                      copyWith(fontWeight: FontWeight.bold, color: bgColor),
                      ),
                  Form(
                    key: _formkey,
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
                const TextFieldNameRealizarAlu(text:"Data Inicio",),
                // TextFormField(
                //   // controller: _dataController,
                //   initialValue:_dateTime.toString (),
                //    keyboardType: TextInputType.datetime,
                //   validator: (data){
                //     if(data==null || data.isEmpty) {
                //       return 'Por favor, degite uma data inicio';
                //     }
                //     return null;
                //   },
                //   onTap: () async {
                //     await showDatePicker(context: context,
                //         initialDate: DateTime.now(),
                //         firstDate: DateTime(2020),
                //         lastDate: DateTime(2050),
                //     ).then((date){
                //       setState(() {
                //         _dateTime =date!;
                //         print(_dateTime);
                //       });
                //     });
                //   },
                //   style: const TextStyle(color: bgColor),
                //   decoration: const InputDecoration(
                //       hintText: "12/12/21",hintStyle: TextStyle(color: Colors.black45)
                //   ),
                // ),
                  const SizedBox(height: defaultPadding,),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12)
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            ElevatedButton(
                                child: Icon(Icons.calendar_today_outlined),
                                onPressed: (){
                                  showDatePicker(context: context,
                                    initialDate: _dateTime==null? DateTime.now():_dateTime,
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime(2050),
                                  ).then((date){
                                    setState(() {
                                      _dateTime =date!;
                                      final DateFormat formatter = DateFormat('yyyy-MM-dd');
                                      final String formatted = formatter.format(_dateTime as DateTime);
                                      // print(formatted);
                                      _dateTime=formatted;
                                    });
                                  });
                                }),
                            VerticalDivider(),
                            Text(_dateTime==null? "Seleciona a data":_dateTime.toString(),
                              textAlign: TextAlign.end,
                              style: const TextStyle(color: bgColor,
                                fontFamily: 'Varela',
                                fontSize: 16.0,),),
                          ],
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: defaultPadding,),
                const TextFieldNameRealizarAlu(text:"Tempo",),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _tempoController,
                  validator: (tempo){
                    if(tempo== null || tempo.isEmpty){
                      return 'Por favor, degite um tempo';
                    }else if(tempo == '0'){
                      return 'Por favor, o tempo nao pode ser 0 ';
                    }
                  },
                  onChanged: (tempo){
                    valorPagar =  widget.precototal;
                    double.parse(valorPagar);
                    setState(() {
                      // var resultado = valorPagar * int.parse(tempo);
                      resultado = mult(double.parse(valorPagar), int.parse(tempo));
                      print(resultado);

                    });
                  },
                  style: const TextStyle(color: bgColor),
                  decoration: const InputDecoration(
                      hintText: "4",hintStyle: TextStyle(color: Colors.black45)
                  ),
                ),
                const SizedBox(height: defaultPadding,),
                const TextFieldNameRealizarAlu(text:"Total a pagar",),
                // TextFormField(
                //    initialValue: "$resultado",
                //   // controller:_precoController,
                //   enabled: false,
                //   style: const TextStyle(color: bgColor),
                //   decoration: const InputDecoration(
                //     // hintText: "6000 CVE",hintStyle: TextStyle(color: bgColor)
                //   ),
                // ),
                // const SizedBox(height: defaultPadding,),
                  Container(
                    height: 57,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12)
                        ),
                    child: Row(
                      children: [
                        Text(resultado==null? "Atribua um Tempo":resultado.toString(),
                          style: const TextStyle(color: bgColor,
                            fontFamily: 'Varela',
                            fontSize: 16.0,),),
                      ],
                    ),
                  ),
                ],
              )
            ),

                      const SizedBox(height: defaultPadding,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed:  () async{
                          print(cliente);
                          if(_dateTime!=null){
                          if(_formkey.currentState!.validate()) {
                            await realizarAluguer(
                                cliente.toString(), widget.matricula,
                                _dateTime.toString(), _tempoController.text,
                                resultado.toString(), estadoAluguer.toString());
                            print(cliente);
                          }
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(deuerrado);
                          }
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

  final deucerto = const SnackBar(content: Text('Aluguer Cadastrado com sucesso',
    textAlign: TextAlign.center,),backgroundColor: Colors.green,);
  final deuerrado = const SnackBar(content: Text('Erro Cadastrar Aluguer!! Verifique os campos',
    textAlign: TextAlign.center,),backgroundColor: remColor,);

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
    print(response.body);
    if(response.statusCode == 200){
      ScaffoldMessenger.of(context).showSnackBar(deucerto);
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Clientes()));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(deuerrado);
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
