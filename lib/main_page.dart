import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:record11/application_color.dart';
import 'package:record11/page_2.dart';


class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<ApplicationColor>(
        builder: (context) => ApplicationColor(),
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Text("Next"),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context){
                  return Page2();
                }));
            },
          ),
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Consumer<ApplicationColor>(
              builder: (context, applicationColor, _) => Text(
                "Revi Tri A - 20170801297",
                style: TextStyle(color: applicationColor.color),
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<ApplicationColor>(
                  builder: (context, applicationColor, _) => AnimatedContainer(
                    margin: EdgeInsets.all(5),
                    width: 100,
                    height: 100,
                    color: applicationColor.color,
                    duration: Duration(milliseconds: 500),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(margin: EdgeInsets.all(5), child: Text("AB")),
                  Consumer<ApplicationColor>(
                    builder: (context, applicationColor, _) => Switch(
                    value: applicationColor.isLightBlue,
                      onChanged: (newValue){
                      applicationColor.isLightBlue = newValue;
                      },
                  ),
                  ),
                    Container(margin: EdgeInsets.all(5),child: Text("LB")),
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
