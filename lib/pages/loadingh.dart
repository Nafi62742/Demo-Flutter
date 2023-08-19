import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class LoadingHome extends StatefulWidget {
  const LoadingHome({Key? key}) : super(key: key);

  @override
  _LoadingHomeState createState() => _LoadingHomeState();
}

class _LoadingHomeState extends State<LoadingHome> {
    Future getData() async {
    DateTime _now = DateTime.now();
    String timeNow =(_now.hour).toString();
    print(timeNow);
    Timer(const Duration(seconds: 1),
            ()=>Navigator.pushReplacementNamed(context, '/home', arguments: {'time':timeNow}));
            // ()=>Navigator.pushReplacementNamed(context, '/wetree', arguments: {'time':timeNow}));

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Image(image: AssetImage('assets/racer_app.png'),
              ),
              const SizedBox(height: 30.0),
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