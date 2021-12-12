import 'package:flutter/material.dart';
import 'package:rent_car/constants.dart';

class Funcionarios_Details extends StatelessWidget {
  final assetPath, cookiename;

  const Funcionarios_Details({this.assetPath,  this.cookiename});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(cookiename,
            style: const TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],
      ),

      body: ListView(
        children: [
          const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              cookiename,
              style: const TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 42.0,
                      fontWeight: FontWeight.bold,
                      color: primaryColor)
            ),
          ),
            const SizedBox(height: 15.0),
            Hero(
              child: Image.asset(assetPath,
              height: 150.0,
              width: 100.0,
              fit: BoxFit.contain
              ),
              tag: assetPath
            ),
            const SizedBox(height: 20.0),
            //Center(
            //   child: Text(cookiename,
            //       style: TextStyle(
            //           fontFamily: 'Varela',
            //           fontSize: 22.0,
            //           fontWeight: FontWeight.bold,
            //           color: Color(0xFFF17532))),
            // ),
            const SizedBox(height: 10.0),
            Center(
              child: Text(cookiename,
                  style: const TextStyle(
                      color: bgColor,
                      fontFamily: 'Varela',
                      fontSize: 24.0)),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 50.0,
                child: const Text('Cold, creamy ice cream sandwiched between delicious deluxe cookies. Pick your favorite deluxe cookies and ice cream flavor.',
                textAlign: TextAlign.center,
                style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 16.0,
                      color: bgColor)
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: primaryColor
                ),
                child: const Center(
                  child: Text('Editar',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                ),
                  )
                )
              )
            )
        ]
      ),
    );
  }
}
