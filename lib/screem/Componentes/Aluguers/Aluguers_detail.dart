import 'package:flutter/material.dart';
import 'package:rent_car/constants.dart';

class Aluguers_Details extends StatelessWidget {
  final assetPath, matricula, estado, tempo,preco,datainicio;

  const Aluguers_Details({this.assetPath, this.matricula, this.estado, this.tempo, this.preco, this.datainicio});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: const Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Alugueres',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
      ),

      body: ListView(
        children: [
            SizedBox(height: 15.0),
            Hero(
              tag: assetPath,
              child: Image.asset(assetPath,
              height: 250.0,
              width: 200.0,
              fit: BoxFit.contain
              )
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(matricula,
                  style: TextStyle(
                      color: primaryColor,
                      fontFamily: 'Varela',
                      fontSize: 24.0)),
            ),
            SizedBox(height: 40.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Preco:: CVE '+preco,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                              fontFamily: 'Varela',
                              fontSize: 20.0,
                              color: bgColor)
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Text('Data Inicio:: '+datainicio,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 20.0,
                                color: bgColor)
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Text('Tempo:: ' +tempo,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 20.0,
                                color: bgColor)
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Text('Preco Total:: ' +preco,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 20.0,
                                color: bgColor)
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
        ]
      ),
    );
  }
}
