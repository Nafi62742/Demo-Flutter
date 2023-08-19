import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtime/Models/image_demo.dart';
import 'package:worldtime/pages/vintage_car.dart';

import 'Profile.dart';
import 'dashboard.dart';
import 'home.dart';

import 'package:worldtime/Models/profile_model.dart';
import 'package:worldtime/pages/dashboard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';




class Vintage extends StatefulWidget {
  const Vintage({Key? key}) : super(key: key);

  @override
  _VintageState createState() => _VintageState();
}

class _VintageState extends State<Vintage> {

  final PageStorageBucket bucket = PageStorageBucket();
  CarDemoModel pm = new CarDemoModel();

  List<CarDemoModel> pml = [];

  String stringResponse='There is no response';
  Map mapResponse = new Map();
  Map dataResponse = new Map();
  Map supportResponse = new Map();

  List<CarDemoModel> localAssetsList = [];


  Future apiCall() async {
    http.Response response;
    // response =  await http.get(Uri.parse("https://mocki.io/v1/4d2e419c-a671-46af-bc36-ab3f3c5acec2"));
    response =  await http.get(Uri.parse("https://mocki.io/v1/8b8c9de7-63c1-451e-8f21-a3a5e0146716"));


    final List<dynamic> jsonData = json.decode(response.body);
    List<CarDemoModel> localAssets =
    jsonData.map((json) => CarDemoModel.fromJson(json)).toList();
    print(response.body);
    setState(() {
      localAssetsList = localAssets;
    });


    // if(response.statusCode==200){
    //   setState(() {
    //
    //
    //
    //
    //     stringResponse = response.body;
    //     mapResponse = json.decode(stringResponse);
    //
    //      List<dynamic> jsonData = json.decode(response.body);
    //
    //     pml = jsonData.map((json) => CarDemoModel.fromJson(json)).toList();
    //
    //     // for(int i = 0; i < response.body.length; i++ ){
    //     //   // pml.add(CarDemoModel.fromJson(json.decode(response.body[i])));
    //     //   pml.add(json.decode(response.body[i]));
    //     // }
    //     setState(() {
    //       print("msg-- ${pml.toString()}");
    //     });
    //
    //
    //     dataResponse= mapResponse['data'];
    //     supportResponse= mapResponse['support'];
    //   });
    //
    // }

  }


  @override
  void initState() {
    apiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: const Text(
          'Vintage Cars',
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
          child:
          localAssetsList.isEmpty ?  const SpinKitCircle(
            color: Colors.blueGrey,
            size: 50.0,
          ):
          GridView.builder(

            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: localAssetsList.length,
            // scrollDirection: ,
            itemBuilder: (BuildContext context, int index) {

              // color: Colors.amber[colorCodes[index]],
              // child: Text('Entry ${entries[index]}')

              return
                Container(
                  height: 50,
                  color: Colors.lightGreen,

                  child: Center(

                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(localAssetsList[index].url.toString()),
                              maxRadius: 80.0,
                              minRadius: 20.0,

                            ),
                          ),
                          Text('This is ${localAssetsList[index].title}'),
                        ],
                      )),
                );
            },
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                childAspectRatio: 3/2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20
            ),

          ),
        ),
        bucket: bucket,
      ),

    );


  }
  bool get wantKeepAlive => true;
}
