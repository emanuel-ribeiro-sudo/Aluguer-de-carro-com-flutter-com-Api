import 'package:flutter/material.dart';
import 'package:rent_car/constants.dart';
import 'package:rent_car/screem/Aluger/realizar.dart';

class Automoveis_Details extends StatelessWidget {
  final assetPath, carroPreco, carroMatricula,carromarca,carrocor,carroestado;

  Automoveis_Details({this.assetPath, this.carroPreco, this.carroMatricula, this.carromarca, this.carrocor, this.carroestado});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],
      ),

      body: ListView(
        children: [
          SizedBox(height: 15.0),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              carromarca,
              style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 42.0,
                      fontWeight: FontWeight.bold,
                      color: primaryColor)
            ),
          ),
            SizedBox(height: 15.0),
            Hero(
              tag: assetPath,
              child: Image.asset(assetPath,
              height: 150.0,
              width: 100.0,
              fit: BoxFit.contain
              )
            ),
            SizedBox(height: 20.0),
            Center(
              child: Text(carroPreco,
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: primaryColor)),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(carroMatricula,
                  style: TextStyle(
                      color: bgColor,
                      fontFamily: 'Varela',
                      fontSize: 24.0)),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text('Cor: '+'${carrocor}'+'      '
                    'Estado: '+'${carroestado}',
                textAlign: TextAlign.center,
                style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 16.0,
                      color: bgColor)
                ),
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
                    if(carroestado!="Ocupado"){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) =>Realizar_Aluguer(
                              matricula:carroMatricula,
                              precototal:carroPreco,
                          )));
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
