import 'package:flutter/material.dart';

class ChooseArea extends StatefulWidget {
  const ChooseArea({Key? key}) : super(key: key);

  @override
  _ChooseAreaState createState() => _ChooseAreaState();
}

class _ChooseAreaState extends State<ChooseArea> {


  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        title: Text('Location choosing'),
        centerTitle: true,
      ),

    );
  }
}
