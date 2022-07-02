
import 'package:flutter/material.dart';
import 'package:flutter_form_validator/screens/qr_scan.dart';
import 'FormPage.dart';
import 'InputDeco_design.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name,email,phone;

  //TextController to read text entered in text field
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  CircleAvatar(
                    radius: 80,
                    child: Image.asset("assets/friendship.png"),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration:buildInputDecoration(Icons.email,"Email"),
                      validator: (String value){
                        if(value.isEmpty)
                        {
                          return 'Please a Enter';
                        }
                        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                          return 'Please a valid Email';
                        }
                        return null;
                      },
                      onSaved: (String value){
                        email = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                    child: TextFormField(
                      controller: password,
                      keyboardType: TextInputType.text,
                      decoration:buildInputDecoration(Icons.lock,"Password"),
                      validator: (String value){
                        if(value.isEmpty)
                        {
                          return 'Please a Enter Password';
                        }
                        return null;
                      },

                    ),
                  ),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: RaisedButton(
                      color: Colors.black,
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => QRScanPage()));


                        if(_formkey.currentState.validate())
                        {
                          print("successful");

                          return;
                        }else{
                          print("UnSuccessfull");
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: BorderSide(color: Colors.black,width: 2)
                      ),
                      textColor:Colors.white,child: Text("Login"),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10,top: 15),
                    child: const Text("Don't have an account?",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black)),
                  ),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: RaisedButton(
                      color: Colors.black,
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => FormPage()));


                        if(_formkey.currentState.validate())
                        {
                          print("successful");

                          return;
                        }else{
                          print("UnSuccessfull");
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: BorderSide(color: Colors.black,width: 2)
                      ),
                      textColor:Colors.white,child: Text("Register"),

                    ),
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }
}
