import 'package:flutter/material.dart';
import 'package:worldtime/appFooter.dart';

import 'auth.dart';
import 'crude_pages/sign_in.dart';


class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  _WidgetTreeState createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('This is footer');
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return const Footer();
          }
          else{
            return const SignIn();
          }
        })
    ;
  }



  // @override
  // Widget build(BuildContext context) {
  //   return Footer();
  // }


}


