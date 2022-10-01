import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:marvelgo/screens/homepage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import '../utils/app_color.dart' as color;
import '../providers/provider.dart';

class Comic extends StatefulWidget {
  const Comic({super.key});

  static String route = '/Comic';

  @override
  State<Comic> createState() => _ComicState();
}

class _ComicState extends State<Comic> {
  var controller = TextEditingController();

  @override
  void initState() {
    Provider.of<ComicProvider>(context, listen: false).search('');
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
            _SearchBar(
              controller: controller,
              label: 'Comic',
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 12, right: 20, left: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(60)),
                ),
                child: const _FetchResult(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
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
                labelText: 'Comics',
                labelStyle: const TextStyle(color: Colors.white),
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
              Provider.of<ComicProvider>(context, listen: false)
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

class _FetchResult extends StatelessWidget {
  const _FetchResult({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ComicProvider>(
      builder: (context, provider, child) {
        return Provider.of<ComicProvider>(context, listen: false).isLoading
            ? Center(
                child: Lottie.asset('assets/images/plane_loading.json'),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 4 / 5,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    hoverColor: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color:
                                color.AppColor.gradientSecond.withOpacity(0.1),
                            blurRadius: 5,
                            offset: const Offset(5, 5),
                          ),
                          BoxShadow(
                            color:
                                color.AppColor.gradientSecond.withOpacity(0.1),
                            blurRadius: 5,
                            offset: const Offset(-5, -5),
                          ),
                          BoxShadow(
                            color:
                                color.AppColor.gradientSecond.withOpacity(0.1),
                            blurRadius: 5,
                            offset: const Offset(-5, 5),
                          ),
                          BoxShadow(
                            color:
                                color.AppColor.gradientSecond.withOpacity(0.1),
                            blurRadius: 5,
                            offset: const Offset(5, -5),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: provider.comics[index].images
                                    .contains('image_not_available')
                                ? Lottie.asset('assets/images/superhero.json')
                                : CachedNetworkImage(
                                    imageUrl: provider.comics[index].images,
                                    fit: BoxFit.cover,
                                    width: 200,
                                    height: 200,
                                  ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                provider.comics[index].title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
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
                itemCount: provider.comics.length,
              );
      },
    );
  }
}
