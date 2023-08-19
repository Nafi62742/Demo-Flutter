import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'home.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {




  final PageStorageBucket bucket = PageStorageBucket();



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Roboto',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),

      body:PageStorage(
        child: Center(
          child: Text('Profile', style: TextStyle(
            fontSize: 20,
          ),
          ),
        ),
        bucket: bucket,
      ),


    );

  }
}
