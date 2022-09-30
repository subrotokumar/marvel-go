import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:marvelgo/screens/homepage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import '../utils/app_color.dart' as color;
import '../providers/provider.dart';

class Character extends StatefulWidget {
  const Character({super.key});

  static String route = '/character';

  @override
  State<Character> createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  var controller = TextEditingController();

  @override
  void initState() {
    Provider.of<CharacterProvider>(context, listen: false).search('');
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.AppColor.gradientFirst.withOpacity(0.9),
              color.AppColor.gradientSecond,
            ],
            begin: const FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pushReplacementNamed(
                      context,
                      HomePage.route,
                    ),
                    child: Icon(Icons.arrow_back_ios,
                        size: 20, color: color.AppColor.secondPageIconColor),
                  ),
                  Expanded(child: Container()),
                  Icon(Icons.info_outline,
                      size: 20, color: color.AppColor.secondPageIconColor),
                ],
              ),
            ),
            const SizedBox(height: 30),
            //   Row(
            //     children: [
            //       const SizedBox(width: 30),
            //       Text(
            //         "Characters",
            //         style: TextStyle(
            //           fontSize: 25,
            //           fontWeight: FontWeight.w500,
            //           color: color.AppColor.secondPageTitleColor,
            //           //   fontFamily: 'PermanentMarker',
            //         ),
            //       ),
            //     ],
            //   ),
            //   const SizedBox(height: 10),
            searchBar(
              controller: controller,
              label: 'Character',
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(60)),
                ),
                child: const FetchResult(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class searchBar extends StatelessWidget {
  const searchBar({
    Key? key,
    required this.controller,
    required this.label,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                labelText: label.toUpperCase(),
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              controller: controller,
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              Provider.of<CharacterProvider>(context, listen: false)
                  .search(controller.text);
            },
            child: Container(
              height: 50,
              width: 50,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white),
                gradient: LinearGradient(
                  colors: [
                    color.AppColor.secondPageContainerGradient1stColor,
                    color.AppColor.secondPageContainerGradient2ndColor,
                  ],
                ),
              ),
              child: Icon(Icons.search_rounded,
                  color: color.AppColor.secondPageIconColor),
            ),
          ),
        ],
      ),
    );
  }
}

class FetchResult extends StatelessWidget {
  const FetchResult({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterProvider>(
      builder: (context, provider, child) {
        return Provider.of<CharacterProvider>(context, listen: false).isLoading
            ? Center(
                child: Lottie.asset('assets/images/plane_loading.json'),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    hoverColor: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color:
                                color.AppColor.gradientSecond.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(5, 5),
                          ),
                          BoxShadow(
                            color:
                                color.AppColor.gradientSecond.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(-5, -5),
                          ),
                          BoxShadow(
                            color:
                                color.AppColor.gradientSecond.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(-5, 5),
                          ),
                          BoxShadow(
                            color:
                                color.AppColor.gradientSecond.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(5, -5),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: provider.Characters[index].thumbnail
                                    .contains('image_not_available')
                                ? Lottie.asset('assets/images/superhero.json')
                                : CachedNetworkImage(
                                    imageUrl:
                                        provider.Characters[index].thumbnail,
                                    fit: BoxFit.cover,
                                    width: 160,
                                    height: 160,
                                  ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                provider.Characters[index].name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black,
                                      blurRadius: 20,
                                      offset: Offset(5, 5),
                                    ),
                                    Shadow(
                                      color: Colors.black,
                                      blurRadius: 20,
                                      offset: Offset(5, -5),
                                    ),
                                    Shadow(
                                      color: Colors.black,
                                      blurRadius: 20,
                                      offset: Offset(-5, -5),
                                    ),
                                    Shadow(
                                      color: Colors.black,
                                      blurRadius: 20,
                                      offset: Offset(-5, 5),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: provider.Characters.length,
              );
      },
    );
  }
}
