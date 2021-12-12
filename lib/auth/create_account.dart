import 'package:flutter/material.dart';
import 'package:rent_car/auth/login.dart';
import 'package:rent_car/constants.dart';
class CreateAccountPage  extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/1.jpg"), fit: BoxFit.cover,),
          ),
          height: MediaQuery.of(context).size.height,
          width:  MediaQuery.of(context).size.width,

        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start ,
              children: [
                Text("Create Account", style: Theme.of(context).textTheme.headline5!.
                copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Row(
                  children: [
                    const Text("Already have an account?",style: TextStyle(color: Colors.white)),
                    TextButton(onPressed: () => Navigator.push(context,MaterialPageRoute(
                        builder: (context)=>const LoginPage(),)
                    ),
                      child: const Text("Sign In",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
                const SignUpForm(),
                const SizedBox(height: defaultPadding *2,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed:  (){},
                      // style: TextButton.styleFrom(backgroundColor: Colors.blue),
                      child: const Text("Sign Up")
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldName(text:"Username",),
            TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  hintText: "test",hintStyle: TextStyle(color: Colors.white)
              ),
            ),
            const SizedBox(height: defaultPadding,),
            TextFieldName(text:"Email",),
            TextFormField(
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: "test@gmail.com",hintStyle: TextStyle(color: Colors.white)
              ),
            ),
            const SizedBox(height: defaultPadding,),
            TextFieldName(text:"Phone",),
            TextFormField(
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  hintText: "+238 9887632",hintStyle: TextStyle(color: Colors.white)
              ),
            ),
            const SizedBox(height: defaultPadding,),
            TextFieldName(text:"Password",),
            TextFormField(
              style: TextStyle(color: Colors.white),
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: "********",hintStyle: TextStyle(color: Colors.white)
              ),
            ),
            const SizedBox(height: defaultPadding,),
            TextFieldName(text:"Confirm Password",),
            TextFormField(

              style: TextStyle(color: Colors.white),
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: "********",hintStyle: TextStyle(color: Colors.white)
              ),
            ),
          ],
        )
    );
  }
}
class TextFieldName extends StatelessWidget {
  const TextFieldName({
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

