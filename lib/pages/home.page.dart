import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'CoffeeScreen.page.dart';

class HomePage extends StatelessWidget {
  final List<MenuOption> menuOptions = [
    MenuOption(
      title: 'Coffee',
      image: 'images/cafe.jpg',
      routeName: '/coffee', // Add the route name for the CoffeeScreen page
    ),
    MenuOption(
      title: 'Petit Dejeuner',
      image: 'images/petit.jpg',
      routeName: '/petitDej', // Add the route name for the PetitDejScreen page
    ),
    MenuOption(
      title: 'Crepe',
      image: 'images/crepe.jpg',
      routeName: '/crepe', // Add the route name for the CrepeScreen page
    ),
    MenuOption(
      title: 'Pancake',
      image: 'images/pancake.jpg',
      routeName: '/crepe', // Add the route name for the CrepeScreen page
    ),
    MenuOption(
      title: 'Gauffre',
      image: 'images/gauffre.jpg',
      routeName: '/crepe', // Add the route name for the CrepeScreen page
    ),
    MenuOption(
      title: 'Cheescake',
      image: 'images/cheescake.jpg',
      routeName: '/crepe', // Add the route name for the CrepeScreen page
    ),
    MenuOption(
      title: 'Sandwitch',
      image: 'images/sandwitch.jpg',
      routeName: '/crepe', // Add the route name for the CrepeScreen page
    ),
    // Add more MenuOption objects if needed
  ];

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Menu'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _Deconnexion(context);
              // Action to perform when the icon is clicked
            },
          ),
        ],
        backgroundColor: Color(0xFF1BBDB8), // Change the color here
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 16, // Spacing between columns
          mainAxisSpacing: 16, // Spacing between rows
        ),
        itemCount: menuOptions.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, menuOptions[index].routeName);
            },
            child: Card(
              elevation: 4, // Add elevation for a raised effect
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        menuOptions[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    menuOptions[index].title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

// ...
}

class MenuOption {
  final String title;
  final String image;
  final String routeName;

  MenuOption({required this.title, required this.image, required this.routeName});
}

Future<void> _Deconnexion(context) async {
  FirebaseAuth.instance.signOut();

  Navigator.of(context).pushNamedAndRemoveUntil('/authentification', (Route<dynamic> route) => false);
}
