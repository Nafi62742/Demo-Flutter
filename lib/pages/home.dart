import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:worldtime/Models/image_demo.dart';
import 'package:worldtime/theme/theme_manager.dart';

import '../Models/slider.dart';
import '../auth.dart';
import '../theme/reUsabeleStuff.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //new slider work
  late PageController _pageController;
  int activePage = 1;
  List<String> images = [
    "assets/racer_app.png",
    "assets/racer_app.png"
  ];


  List<Widget> indicators(imagesLength,currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.grey[800] : Colors.grey[600],
            shape: BoxShape.circle),
      );
    });
  }



  //Firebase things
  final User? user = Auth().currentUser;
  Future<void> signOut() async {
    await Auth().signOut();
  }
  Widget _title(){
    return Text('Hello User');
  }
  Widget _userUid(){
    return Text(user?.email ?? 'User email');
  }
  Widget _signOutbutton(){
    return
    IconButton(
    onPressed: signOut,
    icon: const Icon(Icons.logout),
    );
  }

  Map data = {};

//button theme changer
  ThemeManager _themeManager =ThemeManager();

  bool statebtn = false;

//api calls
  CarDemoModel pm = new CarDemoModel();
  List<CarDemoModel> pml = [];
  String stringResponse='There is no response';
  Map mapResponse = new Map();
  Map dataResponse = new Map();
  Map supportResponse = new Map();
  List<CarDemoModel> localAssetsList = [];
  List<CarSlider> localAssetsList2 = [];

  void dispose(){
    _themeManager.removeListener(themeListener);
  }

  Future apiCall() async {
    http.Response response;
    http.Response response2;
    response = await http.get(
        Uri.parse("https://mocki.io/v1/8b8c9de7-63c1-451e-8f21-a3a5e0146716"));
    response2 = await http.get(
        Uri.parse("https://mocki.io/v1/d55c21a5-cb0c-48bc-b978-f27429740236"));



    final List<dynamic> jsonData = json.decode(response.body);
    List<CarDemoModel> localAssets =
    jsonData.map((json) => CarDemoModel.fromJson(json)).toList();
    // print(response.body);
    setState(() {
      localAssetsList = localAssets;
    });

    final List<dynamic> jsonData2 = json.decode(response2.body);
    List<CarSlider> localAssets2 =
    jsonData2.map((json) => CarSlider.fromJson(json)).toList();
    // print(response2.body);
    setState(() {
      localAssetsList2 = localAssets2;

      // print(localAssetsList2.length);
    });
  }
  List _generateImagesTiles(){
    return localAssetsList2.map((e) => ClipRRect(
      child:
      Image.asset(e.url.toString(),
          fit: BoxFit.cover),
      borderRadius: BorderRadius.circular(15.0),
    )).toList();
  }
  void initState() {
    apiCall();

    _themeManager.addListener(themeListener);
    _pageController = PageController(viewportFraction: 0.8);
    super.initState();
  }
  themeListener(){
    if(mounted){
      setState(() {

      });
    }
  }
  //Theme changing code
  // Provider.of<object>(context);
  bool _value = false;


  final PageStorageBucket bucket = PageStorageBucket();
  //search bar stuff

    Icon cusIcon = Icon(Icons.search);
    Widget cusSearchBar =  const Text(
      'Home',
      style: TextStyle(
        fontSize: 20.0,
        fontFamily: 'Roboto',
      ),
    );


  // @override
  Widget build(BuildContext context) {


    // ModalRoute.of(context)!.settings.arguments;
    // print(ModalRoute.of(context)!.settings.arguments);

    return Scaffold(

      appBar: AppBar(

        leading: IconButton(
          onPressed: (){
          },
          icon: const Icon(Icons.menu),
        ),

        title: cusSearchBar,

        actions: <Widget>[
            IconButton(onPressed: (){
              showSearch(context: context, delegate: CustomSearchDelegate());
            }, icon: cusIcon),
            _signOutbutton(),
        ],
        centerTitle: true,
      ),

      body: PageStorage(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _title(),
              _userUid(),
             SliderNew(),
              SlideNavigator(),

              themeSwitch(context,_value,(){
                setState(() {
                  _value=!_value;
                });
              }),

              // Switch(value: _themeManager.themeMode==ThemeMode.dark,
              //   activeColor: Colors.blue,
              //   onChanged: (isOn) {
              //     print(isOn);
              //     setState(() {
              //       //isOn==true? isOn=false :isOn=true;
              //       // statebtn = isOn;
              //
              //       _themeManager.toggleTheme(isOn);
              //       print('Inside set state $isOn');
              //     });
              //   }
              // ),
              ElevatedButton(
                child: Text('Edit theme'),
                onPressed: (){
                  showDialog(context: context, builder: (context)
                  {
                    return Container(
                      child: const AlertDialog(
                        title: Text('test'),
                        actions: [
                          Text('yes'),

                        ],
                      ),

                    );

                  }
                  );
                },
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: localAssetsList.length,

                itemBuilder: (BuildContext context, int index) {
                  return
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(

                        height: MediaQuery.of(context).size.height*0.2,
                        color: Colors.yellow[600],

                        child: Center(

                            child: Column(
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: CircleAvatar(
                                    // backgroundImage: NetworkImage(localAssetsList[index].url.toString()),
                                    backgroundImage: AssetImage('assets/racer_app.png'),
                                    maxRadius: 50.0,
                                    minRadius: 20.0,
                                  ),
                                ),
                                Text('This is ${localAssetsList[index].title}'),
                              ],
                            )),
                      ),
                    );
                },

              ),

            ],
          ),
        ),
        bucket: bucket,

      ),

    );
  }
  SliderNew(){
    return Container(
        decoration: BoxDecoration(
          color: Colors.orange,

        ),

        child:SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,

          child: PageView.builder(
              itemCount: localAssetsList.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == activePage;
                return slider(localAssetsList,pagePosition,active);
              }),
        ));

  }

  AnimatedContainer slider(images,pagePosition,active){
    double margin = active ? 10 : 20;
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.fastLinearToSlowEaseIn,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          // image: DecorationImage(image: NetworkImage(images[pagePosition].url.toString()))
          image: DecorationImage(image: AssetImage('assets/racer_app.png'))
      ),
    );
  }
  SlideNavigator(){
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: indicators(localAssetsList.length,activePage));
  }
}

class CustomSearchDelegate extends SearchDelegate{
  List<String> searchTerms =[
    'Vintage',
    'Sports',
    'Mini',
    'Sports'
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query='';
      }, icon: Icon(Icons.clear))
    ];
    // TODO: implement buildActions

  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
        close(context, null);
    }, icon: Icon(Icons.arrow_back)
    );
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchSearch =[];
    for(var type in searchTerms){
      if(type.toLowerCase().contains(query.toLowerCase())){
        matchSearch.add(type);
      }
    }
    return ListView.builder(itemCount: matchSearch.length,
      itemBuilder: (context, index){
        var result = matchSearch[index];
        return ListTile(
          onTap: () {
            close(context, result);
            Navigator.pushNamed(
                context,'/$result');
          },
          title: Text(result),

        );
      },
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchSearch =[];
    for(var type in searchTerms){
      if(type.toLowerCase().contains(query.toLowerCase())){
        matchSearch.add(type);
      }
    }
    return ListView.builder(itemCount: matchSearch.length,
      itemBuilder: (context, index){
        var result = matchSearch[index];
        return ListTile(
          onTap: () {
            close(context, result);
            String search = result.toLowerCase();
            print(search);
            Navigator.pushNamed(
                context,'/$search');
          },
          title: Text(result),

        );
      },
    );
    throw UnimplementedError();
  }
  
}


Slider(){
  return CarouselSlider(
    options: CarouselOptions(
        height: 200.0,autoPlay: true,
        autoPlayAnimationDuration: Duration(milliseconds: 2000),


    ),

    // items: ['assets/racer_app.png',].map((i) {
    items: ['assets/racer_app.png',
    'assets/racer_app.png'].map((i) {
      return
        Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 2.0),
              decoration: BoxDecoration(
                  color: Colors.black12
              ),
              child:
              Image(image: AssetImage('$i')),
              // Image(image: NetworkImage(items[i].url.toString())),toString
            );
          },
        );
    }).toList(),
  );
}

