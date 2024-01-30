import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GuestsPage extends StatefulWidget {
  const GuestsPage({super.key});

  @override
  State<GuestsPage> createState() => _GuestsPageState();
}

class _GuestsPageState extends State<GuestsPage> {
  String filterSelected = "Créés";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor:
              const Color(0xFFbf516a), // Pour rendre l'AppBar transparente
          elevation: 0, // Pour supprimer l'ombre de l'AppBar
          primary: true,
          leading: null,
          leadingWidth: 10, // Permet le débordement sur la barre d'état
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/svgs/guests-1.svg",
                height: 18.0,
                colorFilter: const ColorFilter.mode(
                  Color(0xFFfbdfe4),
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              const Text(
                "Les Invités ",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_circle_outlined,
              ),
              color: Colors.white,
            )
          ],
        ),
        const SizedBox(
          height: 15.0,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(
                    color: const Color(0xFFfce0e5),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        "assets/svgs/search.svg",
                        height: 24.0,
                        colorFilter: const ColorFilter.mode(
                          Colors.grey,
                          BlendMode.srcIn,
                        ),
                      ),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Recherche...',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: 'Poppins',
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            filter(context)
          ],
        ),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              bottom: 120,
              left: 10.0,
              right: 10.0,
              top: 10.0,
            ),
            itemBuilder: (context, index) {
              return const GuestCard();
            },
            separatorBuilder: (_, __) => const SizedBox(height: 8.0),
            itemCount: 10,
          ),
        )
      ],
    );
  }

  Widget filter(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          filterItem(
              title: "Créés",
              active: filterSelected.toLowerCase() == "Créés".toLowerCase(),
              onTap: () {
                setState(() {
                  filterSelected = "Créés";
                });
              }),
          const SizedBox(
            width: 8.0,
          ),
          filterItem(
            title: "Scannés",
            active: filterSelected.toLowerCase() == "Scannés".toLowerCase(),
            onTap: () {
              setState(() {
                filterSelected = "Scannés";
              });
            },
          ),
        ],
      ),
    );
  }

  Widget filterItem({String? title, bool? active, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title!.toUpperCase(),
            style: TextStyle(
              color: active! ? Colors.white : Colors.grey,
              fontSize: 10.0,
              fontWeight: active ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5.0),
          AnimatedContainer(
            height: 4.0,
            width: active ? 25.0 : 0,
            decoration: BoxDecoration(
              color: active ? const Color(0xFFbf516a) : Colors.transparent,
              borderRadius: BorderRadius.circular(4.0),
            ),
            duration: const Duration(milliseconds: 200),
          )
        ],
      ),
    );
  }
}

class GuestCard extends StatelessWidget {
  const GuestCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    return SizedBox(
      height: 80.0,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.zero,
        color: const Color.fromARGB(255, 44, 42, 42),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [color.shade700, color.shade400],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/svgs/guest.svg",
                            height: 25.0,
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Flexible(
                                  child: Text(
                                    "Lionnel Nawej",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 35.0,
                                  width: 35.0,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 59, 58, 58),
                                    borderRadius: BorderRadius.circular(35.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                      "assets/svgs/trash-4.svg",
                                      height: 22,
                                      colorFilter: const ColorFilter.mode(
                                          Color(0xFFfce0e5), BlendMode.srcIn),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      const TextSpan(text: 'Type '),
                                      TextSpan(
                                        text: "Couple",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: color,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      const TextSpan(text: 'Table '),
                                      TextSpan(
                                        text: "001",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: color,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
