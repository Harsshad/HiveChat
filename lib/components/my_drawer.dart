import 'package:flutter/material.dart';
import 'package:hivechat/services/auth/auth_service.dart';
import 'package:hivechat/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    //get auth service
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            //logo
            DrawerHeader(
              child: Center(
                child: Image.asset("lib/images/HiveChat1.png"),
                // child: Icon(
                //   Icons.message,
                //   color: Theme.of(context).colorScheme.primary,
                //   size: 40,
                // ),
              ),
            ),

            //home list tile
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                title: Text("H O M E"),
                leading: Icon(Icons.home),
                iconColor: Theme.of(context).colorScheme.primary,
                onTap: () {
                  //pop the Drawer
                  Navigator.pop(context);
                },
              ),
            ),

            //settings
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                title: Text("S E T T I N G S"),
                leading: Icon(Icons.settings),
                iconColor: Theme.of(context).colorScheme.primary,
                onTap: () {
                  //pop the Drawer
                  Navigator.pop(context);
                  //redirect to settings page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),

        //Logout
        Padding(
          padding: const EdgeInsets.only(left: 25.0, bottom: 25),
          child: ListTile(
            title: Text("L O G O U T"),
            leading: Icon(Icons.logout),
            iconColor: Theme.of(context).colorScheme.primary,
            onTap: logout,
          ),
        ),

        //logout list
      ]),
    );
  }
}
