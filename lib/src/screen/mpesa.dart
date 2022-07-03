
import 'package:flutter/material.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';


void main() {
  MpesaFlutterPlugin.setConsumerKey('cwN35zA2CI3s81zLlhBJGG3vM8GX6jIA');
  MpesaFlutterPlugin.setConsumerSecret('UwSGWzRhC8Ngpqe7' );

runApp(LinaNaMpesa ());
}


class LinaNaMpesa extends StatefulWidget {
  const LinaNaMpesa({ Key key }) : super(key: key);

  @override
  State<LinaNaMpesa> createState() => _LinaNaMpesaState();
}

class _LinaNaMpesaState extends State<LinaNaMpesa> {
  @override

Future<void> lipaNaMpesa() async {
dynamic transactionInitialisation;
try {
transactionInitialisation = await MpesaFlutterPlugin.initializeMpesaSTKPush(
businessShortCode: "174379",
transactionType: TransactionType.CustomerPayBillOnline,
amount: 1.0,
partyA:  "600999",
partyB: "600000",
//Lipa na Mpesa Online ShortCode
callBackURL: Uri(scheme: "https",
                 host: "mpesa-requestbin.herokuapp.com",
                 path: "/1hhy6391"),
//This url has been generated from http://mpesa-requestbin.herokuapp.com/?ref=hackernoon.com for test purposes
accountReference: "Sharon Kimutai",
phoneNumber:  "254729916656",
baseUri: Uri(scheme: "https", host: "sandbox.safaricom.co.ke"),
transactionDesc: "purchase",
passKey: "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919");
//This passkey has been generated from Test Credentials from Safaricom Portal
print("TRANSACTION RESULT: " + transactionInitialisation.toString());
	//http://mpesa-requestbin.herokuapp.com/13oo4um1
return transactionInitialisation;
}
	
catch (e) {
print("CAUGHT EXCEPTION: " + e.toString());
}
}

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: RaisedButton(
      color: Color(0xFF481E4D),
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0)),
      onPressed: () {
        lipaNaMpesa();
      },
      child: Text("Lipa na Mpesa", 
      style: TextStyle(color: Colors.white),)))
      
    );
  }
}