import 'package:flutter/material.dart';

import '../../constants.dart';

class Realizar_Aluguer extends StatelessWidget {
  const Realizar_Aluguer({Key? key, this.matricula, this.ciente, this.precototal}) : super(key: key);
  final matricula;
  final ciente;
  final precototal;
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
                      const SignInForm(),

                      const SizedBox(height: defaultPadding *2,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed:  (){},
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
}

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    return Form(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: defaultPadding,),
            const TextFieldNameRealizarAlu(text:"Automovel",),
            TextFormField(
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
              enabled: false,
              style: const TextStyle(color: bgColor),
              decoration: const InputDecoration(
                 // hintText: "Jose Almeida",hintStyle: TextStyle(color: bgColor)
              ),
            ),
            const SizedBox(height: defaultPadding,),
            const TextFieldNameRealizarAlu(text:"Data Inicio",),
            TextFormField(
              style: const TextStyle(color: bgColor),
              decoration: const InputDecoration(
                  hintText: "12/12/21",hintStyle: TextStyle(color: bgColor)
              ),
            ),
            const SizedBox(height: defaultPadding,),
            const TextFieldNameRealizarAlu(text:"Tempo",),
            TextFormField(
              style: const TextStyle(color: bgColor),
              decoration: const InputDecoration(
                  hintText: "4",hintStyle: TextStyle(color: bgColor)
              ),
            ),
            const SizedBox(height: defaultPadding,),
            const TextFieldNameRealizarAlu(text:"Total a pagar",),
            TextFormField(
              enabled: false,
              style: const TextStyle(color: bgColor),
              decoration: const InputDecoration(
                 // hintText: "6000 CVE",hintStyle: TextStyle(color: bgColor)
              ),
            ),
            const SizedBox(height: defaultPadding,),
          ],
        )
    );
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
