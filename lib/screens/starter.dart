import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../components/app_bg.dart';
import 'home.dart';

class Starter extends StatefulWidget {
  const Starter({super.key});

  @override
  State<Starter> createState() => _StarterState();
}

class _StarterState extends State<Starter> {
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                children: [
                  landingWelcome(context),
                  landingLogin(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget landingWelcome(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ZoomIn(
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    "assets/svgs/qr-code-1.svg",
                    height: 250,
                  ),
                  Positioned(
                    bottom: -60.0,
                    child: Image.asset(
                      "assets/icons/weeding-couple-1.png",
                      fit: BoxFit.scaleDown,
                      height: 180.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Spacer(),
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                textAlign: TextAlign.center,
                textScaleFactor: 0.8,
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 35.0,
                    height: 1.3,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w900,
                  ),
                  children: [
                    TextSpan(
                      text: "Bienvenue sur ".toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: "Seating scan !".toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 45.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "L'application qui rend la gestion des invités à votre mariage simple et élégante. Scannez rapidement les invitations de vos invités et attribuer des places de manière intuitive. Plus besoin de stresser sur la disposition des tables, notre application s'occupe de tout !",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade100,
                fontFamily: 'Poppins',
                fontSize: 10.0,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFbf516a),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    pageController.jumpToPage(1);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Continuer',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      SvgPicture.asset(
                        "assets/svgs/next.svg",
                        colorFilter: const ColorFilter.mode(
                          Color(0xFFfce0e5),
                          BlendMode.srcIn,
                        ),
                        height: 22.0,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }

  Widget landingLogin(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ZoomIn(
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    "assets/svgs/qr-code-1.svg",
                    height: 250,
                  ),
                  Positioned(
                    bottom: -60.0,
                    child: Image.asset(
                      "assets/icons/weeding-couple-1.png",
                      fit: BoxFit.scaleDown,
                      height: 180.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Spacer(),
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              textScaleFactor: 0.8,
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 42.0,
                  height: 1.3,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                ),
                children: [
                  TextSpan(
                    text: "Connexion".toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Veuillez entrer votre code d'authentification pour vous connecter à votre évènement. la gestion de votre mariage plus agréable et moins stressante",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey.shade100,
                  fontFamily: 'Poppins',
                  fontSize: 10.0,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(
                  color: const Color(0xFFfce0e5),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Identifiant de l\'évènement..',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontFamily: 'Poppins',
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50.0,
                    width: 70.0,
                    margin: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFbf516a),
                          Color(0xFFe990a0),
                        ],
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30.0),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Home(),
                            ),
                          );
                        },
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/svgs/unlock.svg',
                            height: 22.0,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
