import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:worldtime/Models/profile_model.dart';
import 'dart:convert';
import 'Profile.dart';
import 'home.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  final PageStorageBucket bucket = PageStorageBucket();

  //api use
  ProfileModel pm = new ProfileModel();
  String stringResponse='There is no response';
  Map mapResponse = new Map();
  Map dataResponse = new Map();
  Map supportResponse = new Map();

  Future apiCall() async {
   http.Response response;
   response =  await http.get(Uri.parse("https://reqres.in/api/users/7"));
   print(response.body.toString());
   print(jsonEncode(response.body));
   if(response.statusCode==200){
     setState(() {
       // stringResponse=response.body;
       // mapResponse =json.decode(stringResponse);
       // pm = ProfileModel.fromJson(mapResponse);

       stringResponse = response.body;
       mapResponse = json.decode(stringResponse);
       pm = ProfileModel.fromJson(json.decode(response.body));

       dataResponse= mapResponse['data'];
       supportResponse= mapResponse['support'];
   });

   }

  }

  @override
  void initState() {
    apiCall();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    print('This is map $mapResponse');

    var myData = pm.data;

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
        title: const Text(
        'Dashboard',
        style: TextStyle(
        fontSize: 20.0,
        fontFamily: 'Roboto',
    ),
    ),

    centerTitle: true,
    elevation: 0.0,
    backgroundColor: Colors.blueGrey[800],
    ),

    body:PageStorage(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30.0,40.0,30.0,0.0),
          child:
          myData == null?  SpinKitCircle(
            color: Colors.blueGrey,
            size: 50.0,
          ):
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Center(
                  child: dataResponse.isEmpty? Text('Please wait a bit longer') :
                  CircleAvatar(
                    backgroundImage: NetworkImage(dataResponse['avatar']),
                    radius: 50.0,
                  ),
                ),
                Divider(
                  height: 90.0,
                  color: Colors.grey,
                ),

              Text('Name',style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    letterSpacing: 2.0
                ),

              ),Row(
                children: [
                  dataResponse.isEmpty? Text('Please wait a bit longer') :
                  // Text(dataResponse['first_name'].toString(), style: TextStyle(
                  Text(myData.firstName.toString(), style: TextStyle(
                      fontSize: 28.0,
                    color: Colors.amberAccent[200],
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(width: 10.0),
                  dataResponse.isEmpty? Text('Please wait a bit longer') :
                  Text(myData.lastName.toString(), style: TextStyle(
                      fontSize: 28.0,
                    color: Colors.amberAccent[200],
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.0),
              dataResponse.isEmpty? Text('Please wait a bit longer') :
              Text(dataResponse['first_name'].toString(), style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold
              ),
              ),

            ],
          ),
        ),
      ),
      bucket: bucket,
    ),

    );

  }
}
