import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../utils/utils.dart';
import '../utils/app_color.dart' as color;

class HomePage extends StatelessWidget {
  static const route = "/home";
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding:
            const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 20),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            // Appbar
            Row(
              children: [
                Text(
                  'Marvel',
                  style: TextStyle(
                    fontSize: 30,
                    color: color.AppColor.homePageTitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Text(
                  ' G',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 2),
                CircleAvatar(
                  radius: 12,
                  child: Image.asset('./assets/images/shield.png'),
                ),
                Expanded(child: Container()),
                const Icon(Icons.arrow_back_ios,
                    size: 20, color: Colors.black54),
                const SizedBox(width: 10),
                const Icon(Icons.calendar_today_outlined,
                    size: 20, color: Colors.black54),
                const SizedBox(width: 10),
                const Icon(Icons.arrow_forward_ios,
                    size: 20, color: Colors.black54),
              ],
            ),
            const SizedBox(height: 20),
            // Event Detail Page
            Row(
              children: [
                Text(
                  'Events',
                  style: TextStyle(
                    fontSize: 20,
                    color: color.AppColor.homePageSubtitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 18,
                    color: color.AppColor.homePageSubtitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 5),
                const Icon(
                  Icons.arrow_forward,
                  size: 18,
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Banner Card
            CardView(),
            const SizedBox(height: 5),
            // Wolverine Quote
            SizedBox(
              height: 180,
              width: double.infinity,
              child: Stack(
                children: [
                  // Background Card
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/card.png"),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 40,
                          offset: const Offset(8, 10),
                          color: color.AppColor.gradientSecond.withOpacity(0.3),
                        ),
                        BoxShadow(
                          blurRadius: 40,
                          offset: const Offset(-1, -5),
                          color: color.AppColor.gradientSecond.withOpacity(0.3),
                        )
                      ],
                    ),
                  ),
                  // Wolverine Animation
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      right: 200,
                    ),
                    decoration: BoxDecoration(
                      // color: Colors.redAccent.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Lottie.asset('assets/images/wolverine.json'),
                  ),
                  // Text Area
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    margin: const EdgeInsets.only(left: 150, top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Wolverine',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: color.AppColor.homePageDetail,
                          ),
                        ),
                        const SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            text: 'The Pain lets you know\n',
                            style: TextStyle(
                              color: color.AppColor.homePagePlanColor,
                              fontSize: 16,
                            ),
                            children: const [
                              TextSpan(text: 'you\'re still alive')
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  "Explore",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: color.AppColor.homePageTitle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            SizedBox(
              height: 360,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    hoverColor: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      if (index < 2) {
                        Navigator.pushReplacementNamed(
                            context, catergories[index].route);
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Coming soon..."),
                        ));
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
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
                          )
                        ],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 80,
                              child: Image.asset(catergories[index].logo),
                            ),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                catergories[index].title,
                                style: TextStyle(
                                  fontFamily: 'PermanentMarker',
                                  fontSize: 20,
                                  color: color.AppColor.homePageDetail,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: catergories.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardView extends StatelessWidget {
  Widget child;
  CardView({Key? key, this.child = const SizedBox(width: double.infinity)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: const BoxDecoration(
        // gradient: LinearGradient(
        // colors: [
        //   Colors.red.withOpacity(0.9),
        //   Colors.red.withOpacity(0.6),
        // ],
        //   begin: Alignment.bottomLeft,
        //   end: Alignment.centerRight,
        // ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(80),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(5, 10),
            blurRadius: 20,
            color: Colors.grey,
          )
        ],
        // image: const DecorationImage(
        //   image: NetworkImage(
        //     'https://images.unsplash.com/photo-1612036782180-6f0b6cd846fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y29taWN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
        //   ) ,
        //   fit: BoxFit.cover,
        //   opacity: 0.8,
        // ),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(80),
            ),
            child: Opacity(
              opacity: 0.8,
              child: CachedNetworkImage(
                imageUrl:
                    'https://images.unsplash.com/photo-1612036782180-6f0b6cd846fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y29taWN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
