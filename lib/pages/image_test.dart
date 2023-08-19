// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:worldtime/Models/image_demo.dart';
// import 'package:worldtime/pages/vintage_car.dart';
//
// import 'Profile.dart';
// import 'dashboard.dart';
// import 'home.dart';
//
// import 'package:worldtime/Models/profile_model.dart';
// import 'package:worldtime/pages/dashboard.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
//
//
//
// class Vintage extends StatefulWidget {
//   const Vintage({Key? key}) : super(key: key);
//
//   @override
//   _VintageState createState() => _VintageState();
// }
//
// class _VintageState extends State<Vintage> {
//   int currentTab = 3;
//   final List<Widget> screens = [
//     Home(),
//     Profile(),
//     Dashboard(),
//     Vintage()
//   ];
//   final PageStorageBucket bucket = PageStorageBucket();
//   Widget currentScreen = Vintage();
//
//   CarDemoModel pm = new CarDemoModel();
//
//   List<CarDemoModel> pml = [];
//
//   String stringResponse='There is no response';
//   Map mapResponse = new Map();
//   Map dataResponse = new Map();
//   Map supportResponse = new Map();
//   Future apiCall() async {
//     http.Response response;
//     response =  await http.get(Uri.parse("https://mocki.io/v1/4d2e419c-a671-46af-bc36-ab3f3c5acec2"));
//     print(response.body.toString());
//     print(jsonEncode(response.body));
//     if(response.statusCode==200){
//       setState(() {
//         // stringResponse=response.body;
//         // mapResponse =json.decode(stringResponse);
//         // pm = ProfileModel.fromJson(mapResponse);
//
//         stringResponse = response.body;
//         mapResponse = json.decode(stringResponse);
//
//         for(int i = 0; i < response.body.length; i++ ){
//           pml.add(CarDemoModel.fromJson(json.decode(response.body[i])));
//         }
//
//        // pml = CarDemoModel.fromJson(json.decode(response.body));
//
//         dataResponse= mapResponse['data'];
//         supportResponse= mapResponse['support'];
//       });
//
//     }
//
//   }
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//
//       appBar: AppBar(
//         title: const Text(
//           'Vintage Cars',
//           style: TextStyle(
//             fontSize: 20.0,
//             fontFamily: 'Roboto',
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.blueGrey,
//       ),
//
//       body:PageStorage(
//
//         child: Center(
//           child:
//           pml.isEmpty ?  SpinKitCircle(
//             color: Colors.blueGrey,
//             size: 50.0,
//           ):
//           GridView.builder(
//
//             physics: NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             padding: const EdgeInsets.all(8),
//             itemCount: pml.length,
//             itemBuilder: (BuildContext context, int index) {
//
//               // color: Colors.amber[colorCodes[index]],
//               // child: Text('Entry ${entries[index]}')
//
//               return
//               Container(
//                 height: 50,
//                 color: Colors.amber,
//                 child: Center(
//
//                     child: Text('Entry ${pml[index].title}')),
//               );
//             },
//             gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                 maxCrossAxisExtent: 120,
//                 childAspectRatio: 3/2,
//                 crossAxisSpacing: 20,
//                 mainAxisSpacing: 20
//             ),
//
//           ),
//         ),
//         bucket: bucket,
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.home),
//         onPressed: (){
//           currentScreen = Home();
//           currentTab =0 ;
//           Navigator.pop(context);
//
//         },
//
//       ),
//
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//
//
//       bottomNavigationBar: BottomAppBar(
//         shape: CircularNotchedRectangle(),
//         notchMargin: 15,
//         child: Container(
//           height: 50,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   MaterialButton(
//                     minWidth: 40,
//                     onPressed: (){
//                       setState(() {
//                         currentScreen = Profile();
//                         currentTab =1 ;
//                         Navigator.pushReplacementNamed(context, '/profile');
//                       });
//                     },
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Icon(Icons.people,
//                           color: currentTab==1?Colors.blueGrey : Colors.grey,
//                         ),
//                         Text(
//                           'Profile',
//                           style: TextStyle(
//                               color: currentTab==1?Colors.blueGrey : Colors.grey
//                           ),
//                         )
//
//                       ],
//
//                     ),
//
//                   ),
//
//                 ],
//
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   MaterialButton(
//                     minWidth: 40,
//                     onPressed: (){
//                       setState(() {
//                         currentScreen = Vintage();
//                         currentTab =2 ;
//                       });
//                     },
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.dashboard,
//                           color: currentTab==2?Colors.blueGrey : Colors.grey,
//                         ),
//                         Text(
//                           'Dashboard',
//                           style: TextStyle(
//                               color: currentTab==2?Colors.blueGrey : Colors.grey
//                           ),
//                         )
//
//                       ],
//
//                     ),
//
//                   ),
//
//                 ],
//
//               )
//             ],
//           ),
//         ),
//
//       ),
//     );
//
//
//   }
// }
