import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Cardview extends StatelessWidget {
  Widget child;
  String imageURL;
  Cardview(this.child, this.imageURL, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Card(
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: imageURL,
              fit: BoxFit.cover,
            ),
            Container()
          ],
        ),
      ),
    );
  }
}
