
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_form_validator/src/screen/home.dart';
import 'package:flutter_form_validator/widgets/button_widget.dart';


//import '../main_one.dart';

class QRScanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  String qrCode = 'Unknown';

  @override
  TextEditingController textFieldController = TextEditingController();
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.grey,

    body: Center(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          const Text(
            'Scan Result',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),

          ),
          SizedBox(height: 8),
          Text(
            '$qrCode',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 72),
          ButtonWidget(
            text: 'Start QR scan',
            onClicked: () => scanQRCode(), key: ObjectKey(ButtonWidget),
          ),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton.extended(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  Home() ));
      },
      label: const Text(
        "Next",
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.deepPurpleAccent,
    ),

  );

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }
//sendCartNo(BuildContext context){
//String toSend = textFieldController.text;
//Navigator.push(context,
// MaterialPageRoute(builder: (context)=>ItemsPage(cartNo:toSend,))
// );
//}
}
