

import 'package:flutter/material.dart';

import '../main.dart';

Widget themeSwitch(BuildContext context, bool valuePage, Function onTap) {
  return Container(
    child: Switch(
      value: valuePage,
      onChanged: (value) {
        onTap();
        valuePage = value;
        if (valuePage)
          MyApp.of(context)!.changeTheme(ThemeMode.dark);
        else
          MyApp.of(context)!.changeTheme(ThemeMode.light);
      },
    ),
  );
  //The calling method will be like this
  // themeSwitch(context, _value,(){
  //   setState(() {
  //     _value = !_value;
  //   });
  // }),
}