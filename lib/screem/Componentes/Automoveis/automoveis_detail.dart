import 'package:flutter/material.dart';
import 'package:rent_car/constants.dart';
import 'package:rent_car/screem/Aluger/realizar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Automoveis_Details extends StatefulWidget {
  final assetPath, carroPreco, carroMatricula,carromarca,carrocor,carroestado;


  Automoveis_Details({this.assetPath, this.carroPreco, this.carroMatricula, this.carromarca, this.carrocor, this.carroestado});

  @override
  State<Automoveis_Details> createState() => _Automoveis_DetailsState();
}

class _Automoveis_DetailsState extends State<Automoveis_Details> {
  late Map data;
  List multaData = [];
  List naoPago = [];
  getMultas(String matricula) async {
    var url = Uri.parse('$ApiPN_CV/multa');
    http.Response response = await http.post(url,
        headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },body: jsonEncode(<String, String>{
          "matricula_carro": matricula
        })
    );
    if(response.statusCode == 200){
      //debugPrint(response.body);
      data = jsonDecode(response.body);
      print(data['multa']);
      setState(() {
        multaData = data['multa'];
      });
    }
    for(int i=0; i<multaData.length;i++){
      if(multaData[i]['estado'] == 'Nao Pago'){
        setState(() {
          print(i);
          naoPago=multaData;
        });
      }
  }
  // getNaoPago(){
  //
  //   }
  }
  @override
  void initState(){
    super.initState();
    getMultas(widget.carroMatricula);
    // getNaoPago();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: naoPago.length!=0? Colors.red: Colors.white,
      appBar: AppBar(
        backgroundColor: naoPago.length!=0? Colors.red: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Automovel',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
        //     onPressed: () {
        //       print(multaData[0]['estado']);
        //       print(naoPago.length);
        //     },
        //   ),
        // ],
      ),

      body: ListView(
        children: [
          SizedBox(height: 15.0),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              widget.carromarca,
              style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 42.0,
                      fontWeight: FontWeight.bold,
                      color: primaryColor)
            ),
          ),
            SizedBox(height: 15.0),
            Hero(
              tag: widget.assetPath,
              child: Image.asset(widget.assetPath,
              height: 150.0,
              width: 100.0,
              fit: BoxFit.contain
              )
            ),
            SizedBox(height: 20.0),
            Center(
              child: Text(widget.carroPreco,
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: primaryColor)),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(widget.carroMatricula,
                  style: TextStyle(
                      color: bgColor,
                      fontFamily: 'Varela',
                      fontSize: 24.0)),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 50.0,
                    child: Text('Cor: '+'${widget.carrocor}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 16.0,
                          color: bgColor)
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 50.0,
                    child: Text('Estado: '+'${widget.carroestado}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 18.0,
                            color: widget.carroestado=='Livre'? Colors.green: Colors.red)
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: primaryColor
                ),

                child: Center(
                  child: TextButton(
                  child: Text('Alugar',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,

                ),
                  ),
                      onPressed: (){
                    if(widget.carroestado!="Ocupado"){
                      if(naoPago.length!=0){
                        ScaffoldMessenger.of(context).showSnackBar(erro);
                      }else {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) =>
                                Realizar_Aluguer(
                                  matricula: widget.carroMatricula,
                                  precototal: widget.carroPreco,
                                )));
                      }
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                      }

                  )
                )
              )
            )
            ]
      ),
    );
  }

  final snackBar = const SnackBar(content: Text('Automovel Ocuoado',
    textAlign: TextAlign.center,),backgroundColor: remColor,);
}
