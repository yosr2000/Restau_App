import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import 'authentification.page.dart';
import 'inscription.page.dart';

// var data = [
//   {
//     'name': 'cofee',
//     'children': [
//       {
//         'name': 'cofee chaud',
//         'children': [
//           {
//             'name': 'cappucino',
//             'price':45
//           },
//           {'name': 'cappucino2',
//           'children':[
//             {
//               'name': 'cappucino aa',
//               'price':450
//             },
//             {
//               'name': 'cappucino bb',
//               'price':458
//             },
//           ]}
//         ]
//       },
//       {}
//     ]
//   }
// ];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    super.initState();
  }

  Widget _buildImage(String assetName, [double width = 400]) {
    return Image.asset('images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Color(0xFFDCEECFF),
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Color(0xFFD37CADA),
      pages: [
        PageViewModel(
          title: "Bienvenue dans notre Salon de thé et restaurant",
          body: "situé à Route Lafrane km 4 a coté de mahsouna ",
          image: Lottie.network(
              'https://assets5.lottiefiles.com/private_files/lf30_D4yZiV.json'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Service Rapide',
          body: "un très bon service avec un accueil chaleureux.",
          image: Lottie.network(
              'https://assets6.lottiefiles.com/packages/lf20_BiAtYn.json'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Meilleure adresse",
          body: "On vous attend avec impatience pour découvrir cet adresse.",
          image: Image.asset('images/image1.jpg'),
          footer: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InscriptionPage()),
                  );
                },
                child: const Text(
                  'S\'inscrire',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFD37CADA),
                  shape: StadiumBorder(),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AuthentificationPage()),
                  );
                },
                child: const Text(
                  'S\'authentifier',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).hoverColor,
                  shape: StadiumBorder(),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                ),
              ),
            ],
          ),
          decoration: pageDecoration,
        ),
      ],
      showSkipButton: false,
      showDoneButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      back: const Text('Retour',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          )),
      next: const Text('Suivant',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(8.0, 8.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(15.0, 5.0),
        activeColor: Colors.blue,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
