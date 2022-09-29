import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../utils/app_color.dart' as color;
import '../models/models.dart';

class CharacterList extends StatefulWidget {
  final nameStartWith;
  const CharacterList(this.nameStartWith, {super.key});

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  List<Character> character = [];

  @override
  Widget build(BuildContext context) {
    return isLoading
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
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: color.AppColor.gradientSecond.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(5, 5),
                      ),
                      BoxShadow(
                        color: color.AppColor.gradientSecond.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(-5, -5),
                      ),
                      BoxShadow(
                        color: color.AppColor.gradientSecond.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(-5, 5),
                      ),
                      BoxShadow(
                        color: color.AppColor.gradientSecond.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(5, -5),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      CachedNetworkImage(imageUrl: character[index].thumbnail),
                      Text(character[index].name)
                    ],
                  ),
                ),
              );
            },
            itemCount: 10,
          );
  }
}
