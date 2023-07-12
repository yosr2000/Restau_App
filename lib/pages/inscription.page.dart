import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';

import 'authentification.page.dart';
import 'home.page.dart';

class InscriptionPage extends StatefulWidget {
  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  TextEditingController txt_login = TextEditingController();
  TextEditingController txt_password = TextEditingController();

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 50,),
        Lottie.network('https://assets4.lottiefiles.com/packages/lf20_mjlh3hcy.json'),
        SizedBox(height: 25,),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextField(
            controller: txt_login,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlue),
              ),
              fillColor: Colors.white,
              filled: true,
              hintText: "Nom d'utilisateur",
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextField(
            obscureText: true,
            controller: txt_password,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlue),
              ),
              fillColor: Colors.white,
              filled: true,
              hintText: "Mot de passe",
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: ElevatedButton(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
          child: Text(
            'Inscription',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        onPressed: () => onInscrire(context),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AuthentificationPage()),
        );
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'J\'ai déjà un compte ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
            TextSpan(
              text: 'Connexion',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.blue,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFDCEECFF),
                      Color(0xFFDCEECFF),
                      Color(0xFFDCEECFF),
                      Color(0xFFDCEECFF)
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      _buildEmailTF(),
                      SizedBox(height: 10.0),
                      _buildPasswordTF(),
                      _buildLoginBtn(),
                      _buildSignupBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onInscrire(BuildContext context) async {
    SnackBar?snackBar;

    if (txt_login.text.isNotEmpty && txt_password.text.isNotEmpty) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: txt_login.text.trim(),
          password: txt_password.text.trim(),
        );

        Navigator.pop(context);
        Navigator.pushNamed(context, '/home');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          snackBar = SnackBar(
            content: Text('Mot de passe faible'),
          );
        } else if (e.code == 'email-already-in-use') {
          snackBar = SnackBar(
            content: Text('Email déjà existant'),
          );
        }
      }

      if (snackBar != null) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      snackBar = SnackBar(
        content: Text('Identifiant ou mot de passe vide'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
