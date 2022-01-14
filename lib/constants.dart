import 'package:flutter/material.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);
const remColor = Color(0xFFF33F3F);
const Heroheight = 90.0;
const Herowidth = 100.0;
const defaultPadding = 16.0;

OutlineInputBorder textFieldBorder = OutlineInputBorder(
  borderSide: BorderSide(
      color: Colors.black.withOpacity(0.1)
  ),
);
const String URL = '192.168.42.233';
const String BASE_URL = 'http://$URL:3333';
const String ApiDGTR  = 'http://$URL:8080';
const String ApiPN_CV  = 'http://$URL:1322';

final erro = const SnackBar(content: Text('Operacao Indisponivel',
  textAlign: TextAlign.center,),backgroundColor: remColor,);