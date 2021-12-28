import 'package:flutter/material.dart';
import 'package:rent_car/screem/auth/login.dart';
import '../constants.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          }),
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          textTheme: Theme.of(context).textTheme.apply(displayColor: primaryColor),
          elevatedButtonTheme:
          ElevatedButtonThemeData(style:
          TextButton.styleFrom(
              backgroundColor: primaryColor,
              padding: const EdgeInsets.all(defaultPadding)
          ),),
          inputDecorationTheme: InputDecorationTheme(
              border:textFieldBorder,
              enabledBorder:textFieldBorder,
              focusedBorder: textFieldBorder
          )),
      home: const MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
            body: Stack(
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/1.jpg"), fit: BoxFit.cover,),
                  ),
                  height: MediaQuery.of(context).size.height,
                  width:  MediaQuery.of(context).size.width,
                ),
                Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                      children:[
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                          child: SizedBox(
                            width:double.infinity ,
                            child: ElevatedButton(
                              onPressed: ()=>Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>const LoginPage())),
                              style: TextButton.styleFrom(
                                  backgroundColor: primaryColor
                              )
                                ,

                              child: const Text("Sing In"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width:double.infinity ,
                          child: ElevatedButton(
                            onPressed: ()=> Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>const MyHomePage())),
                            style: TextButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                shape: const RoundedRectangleBorder(side: BorderSide(
                                    color: primaryColor
                                ))
                            )
                          ,
                            child: const Text("Sign Up",
                              style: TextStyle(
                                  color: primaryColor
                              ),),
                          ),
                        ),
                        const Spacer()
                      ]
                  ),
                )

              ],
            )
        )
    );
  }
}


