import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
class Bitcoin extends StatefulWidget {
  const Bitcoin({Key key}) : super(key: key);

  @override
  _BitcoinState createState() => _BitcoinState();
}

class _BitcoinState extends State<Bitcoin> {
  String _valor = "0";
  void _atualizar () async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);
    Map <String, dynamic > retorno = json.decode(response.body);
    setState(() {
      _valor = retorno ["BRL"] ["buy"].toString();
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("img/bitcoin.png"),
            Padding( padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text( "R\$ " + _valor,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            RaisedButton(onPressed: _atualizar,
              color: Colors.amber,

             child: Text("atualizar",
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 25,
               ),

             ),)


          ],
        ),
      ),
    );
  }
}
