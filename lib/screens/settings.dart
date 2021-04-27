import 'package:estore/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  static String routeName = '/settings';
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Prefrences"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Text("Choose Account Prefrences",
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center),
            SizedBox(height: 20),
            menuItem("Enable Notifications"),
            menuItem("Receive Email Newsletters"),
            menuItem("Get New Offers' Alerts"),
          ],
        ),
      ),
    );
  }

  menuItem(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Color(0xFFF5F6F9),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        title: Text(
          text,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        trailing: SwitchBar(),
      ),
    );
  }
}
