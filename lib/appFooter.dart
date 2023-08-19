import 'package:flutter/material.dart';
import 'package:worldtime/pages/Profile.dart';
import 'package:worldtime/pages/dashboard.dart';
import 'package:worldtime/pages/home.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {


  int currentTab = 0;
  final List<Widget> screens = [
    Home(),
    Profile(),
    Dashboard()
  ];
  PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Home();



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.people,
          color: currentTab==0?Colors.blueGrey : Colors.blue,
        ),
        onPressed: (){
          setState(() {
            currentScreen = Home();
            currentTab =0 ;
          });
        },

      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 15,
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen = Profile();
                        currentTab =1 ;
                        // Navigator.pushNamed(context, '/profile');
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.people,
                          color: currentTab==1?Colors.blueGrey : Colors.grey,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                              color: currentTab==1?Colors.blueGrey : Colors.grey
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen = Dashboard();
                        currentTab =2 ;
                        // Navigator.pushNamed(context, '/dashboard');
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.dashboard,
                          color: currentTab==2?Colors.blueGrey : Colors.grey,
                        ),
                        Text(
                          'Dashboard',
                          style: TextStyle(
                              color: currentTab==2?Colors.blueGrey : Colors.grey
                          ),
                        )

                      ],

                    ),

                  ),

                ],

              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       title: Text('Home'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.people),
      //       title: Text('Profile'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.dashboard),
      //       title: Text('Dashboard'),
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   onTap: _onTap,
      //
      // ),
    );
  }
}
