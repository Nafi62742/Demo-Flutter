import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
    Future getData() async {
    DateTime _now = DateTime.now();
    String timeNow =(_now.hour).toString();
    // print(timeNow);
    Timer(const Duration(seconds: 3),
            // ()=>print("3 sec done"),    );
            // ()=>Navigator.pushReplacementNamed(context, '/footer', arguments: {'time':timeNow}));

            ()=>Navigator.pushReplacementNamed(context, '/wetree', arguments: {'time':timeNow}));
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Image(image: AssetImage('assets/racer_app.png'
              ),

              ),
              const SizedBox(height: 20.0),
              splash(),

            ],
          ),

        ),

    );
  }
}

splash(){
  return const SpinKitCircle(
    color: Colors.blueGrey,
    size: 50.0,

  );
}