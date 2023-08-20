import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // profile and user name in a row with height and width
              SizedBox(
                height: 50, // Set the desired height
                width: width * 1, // Set the full width of the screen
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage("lib/images/img_2.png"),
                        radius: 40, // Adjust as needed
                      ),
                      const Text(
                        "SRT0078",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const Spacer(), // Add a spacer to push the settings icon to the end
                      IconButton(
                        icon: const Icon(
                          Icons.menu, // Replace with your desired icon
                        ),
                        onPressed: () {
                          // Add your button's onPressed functionality here
                        },
                      ),
                    ],
                  ),
                ),
              ),

              // Image with height and width
                Image.asset(
                  'lib/images/img_2.png',
                  height: height * 0.5, // Set the desired height
                  width: width * 1, // Set the desired width
                ),

              // icon bar
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border_outlined),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.messenger_outline),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.send_and_archive_outlined),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.save_outlined),
                    )
                  ],
                ),
              ),

              // like components
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    // image
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("lib/images/img_2.png"),
                        radius: 10, // Adjust as needed
                      ),
                    ),
                    // text
                    Text(
                      "Liked by ",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "ak_uttam_akkk",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " and ",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "93,442 others",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Adventure in Nepal👌⛷️",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              // comments
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "View all 500 comments",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),

              // time
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "19 July",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    const Text(
                      "Suggest for you",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.cancel_outlined),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
