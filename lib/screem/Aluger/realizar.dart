

import 'package:flutter/material.dart';

import '../../constants.dart';

class Realizar_Aluguer extends StatelessWidget {
  var x;

  Realizar_Aluguer({Key? key, this.matricula, this.ciente, this.precototal}) : super(key: key);
  final matricula;
  final ciente;
  final precototal;
  final _matriculaController = TextEditingController();
  final _precoController = TextEditingController();
  final _tempoController = TextEditingController();
  final _dataController= TextEditingController();
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
                  initialValue: matricula,
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
//
// class SignInForm extends StatefulWidget {
//   const SignInForm({Key? key}) : super(key: key);
//
//   @override
//   State<SignInForm> createState() => _SignInFormState();
// }
//
// class _SignInFormState extends State<SignInForm> {
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: defaultPadding,),
//             const TextFieldNameRealizarAlu(text:"Automovel",),
//             TextFormField(
//               enabled: false,
//               style: const TextStyle(color: bgColor),
//               keyboardType: TextInputType.emailAddress,
//               decoration: const InputDecoration(
//                  // hintText: "ST-12-IO",hintStyle: TextStyle(color: bgColor)
//               ),
//             ),
//             const SizedBox(height: defaultPadding,),
//             const TextFieldNameRealizarAlu(text:"Cliente",),
//             TextFormField(
//               enabled: false,
//               style: const TextStyle(color: bgColor),
//               decoration: const InputDecoration(
//                  // hintText: "Jose Almeida",hintStyle: TextStyle(color: bgColor)
//               ),
//             ),
//             const SizedBox(height: defaultPadding,),
//             const TextFieldNameRealizarAlu(text:"Data Inicio",),
//             TextFormField(
//               style: const TextStyle(color: bgColor),
//               decoration: const InputDecoration(
//                   hintText: "12/12/21",hintStyle: TextStyle(color: bgColor)
//               ),
//             ),
//             const SizedBox(height: defaultPadding,),
//             const TextFieldNameRealizarAlu(text:"Tempo",),
//             TextFormField(
//               style: const TextStyle(color: bgColor),
//               decoration: const InputDecoration(
//                   hintText: "4",hintStyle: TextStyle(color: bgColor)
//               ),
//             ),
//             const SizedBox(height: defaultPadding,),
//             const TextFieldNameRealizarAlu(text:"Total a pagar",),
//             TextFormField(
//               enabled: false,
//               style: const TextStyle(color: bgColor),
//               decoration: const InputDecoration(
//                  // hintText: "6000 CVE",hintStyle: TextStyle(color: bgColor)
//               ),
//             ),
//             const SizedBox(height: defaultPadding,),
//           ],
//         )
//     );
//   }
// }

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
