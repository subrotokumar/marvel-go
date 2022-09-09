import 'package:flutter/material.dart';

//import
import '../utils/utils.dart';

class HomePage extends StatelessWidget {
  static const route = "/home";
  HomePage({super.key});

  PreferredSizeWidget appbar = AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Text(
          'MARVEL',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            fontFamily: 'PermanentMarker',
          ),
        ),
        Text(
          ' GO',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            fontFamily: 'PermanentMarker',
          ),
        ),
      ],
    ),
    centerTitle: true,
    elevation: 0.0,
    backgroundColor: Colors.white10,
    actions: [
      CircleAvatar(
        radius: 15,
        child: Image.asset('./assets/images/shield.png'),
      ),
      SizedBox(
        width: 20,
      )
    ],
    iconTheme: const IconThemeData(color: Colors.red),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1612036782180-6f0b6cd846fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y29taWN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                    ),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 550,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromRGBO(236, 29, 36, 1),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 80,
                            child: Image.asset(catergories[index].logo),
                          ),
                          Text(
                            catergories[index].title,
                            style: const TextStyle(
                              fontFamily: 'PermanentMarker',
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: catergories.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
