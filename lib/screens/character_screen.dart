import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:marvelgo/screens/homepage.dart';
import '../utils/app_color.dart' as color;

class Character extends StatefulWidget {
  const Character({super.key});

  static String route = '/character';

  @override
  State<Character> createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  var controller = TextEditingController();

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
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, HomePage.route),
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
            Row(
              children: [
                const SizedBox(width: 30),
                Text(
                  "Characters",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: color.AppColor.secondPageTitleColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
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
                    onTap: () {},
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
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(70)),
                ),
                child: Center(
                  child: Lottie.asset('assets/images/plane_loading.json'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
