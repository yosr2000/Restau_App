import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../config/global.params.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email ?? '';

    return Drawer(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   //colors: [Colors.white, Colors.blueGrey],
              //
              // ),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("images/profile1.jpg"),
                ),
                SizedBox(height: 16),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: GlobalParams.menus.length,
              itemBuilder: (context, index) {
                final item = GlobalParams.menus[index];
                return ListTile(
                  title: Text(
                    item['title'],
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: item['icon'],
                  trailing: Icon(Icons.arrow_right, color: Colors.grey),
                  onTap: () async {
                    if (item['title'] != "Déconnexion") {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, item['route']);
                    } else {
                      FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        '/authentification',
                            (Route<dynamic> route) => false,
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
