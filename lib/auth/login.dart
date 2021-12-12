import 'package:flutter/material.dart';
import 'package:rent_car/auth/create_account.dart';
import 'package:rent_car/constants.dart';
import 'package:rent_car/screem/cliente/clientes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:SizedBox(
        height: MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
        child: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/1.jpg"), fit: BoxFit.cover,),
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
                      Text("Login", style: Theme.of(context).textTheme.headline5!.
                      copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Row(
                        children: [
                          const Text("No have an account?",style: TextStyle(color: Colors.white),),
                          TextButton(onPressed: ()=> Navigator.push(context,MaterialPageRoute(
                              builder: (context)=>CreateAccountPage())),
                              child: const Text("Sign Up",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          )
                        ]),

                      const SignInForm(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(onPressed: (){},
                            child: const Text("Forgot Password?",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      const SizedBox(height: defaultPadding *2,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed:  ()=>Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>Clientes())),
                            child: const Text("Sign In")
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

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Form(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: defaultPadding,),
            TextFieldNameLogin(text:"Email",),
            TextFormField(
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: "test@gmail.com",hintStyle: TextStyle(color: Colors.white)
              ),
            ),
            const SizedBox(height: defaultPadding,),
            const TextFieldNameLogin(text:"Password",),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: "********",hintStyle: TextStyle(color: Colors.white)
              ),
            ),
            const SizedBox(height: defaultPadding,),
          ],
        )
    );
  }
}

class TextFieldNameLogin extends StatelessWidget {
  const TextFieldNameLogin({
    Key? key,required this.text
  }):super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding/3),
      child: Text(text,
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white.withOpacity(0.5)),
      ),
    );
  }
}
