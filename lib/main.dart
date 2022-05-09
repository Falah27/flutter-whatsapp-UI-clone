import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imageUrl = [
    'https://randomuser.me/api/portraits/men/29.jpg',
    'https://randomuser.me/api/portraits/men/48.jpg',
    'https://randomuser.me/api/portraits/women/21.jpg',
    'https://randomuser.me/api/portraits/women/60.jpg',
    'https://randomuser.me/api/portraits/men/81.jpg',
    'https://randomuser.me/api/portraits/men/42.jpg',
    'https://randomuser.me/api/portraits/women/31.jpg',
    'https://randomuser.me/api/portraits/women/50.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0.0,
          title: Text(
            "Whatsupp",
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.call)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Text(
                      "Story Your Friends",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                  Container(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Story(imageUrl[0], 'Abdul'),
                        Story(imageUrl[1], 'Rohman'),
                        Story(imageUrl[2], 'Jessica'),
                        Story(imageUrl[3], 'Mitsuki'),
                        Story(imageUrl[4], 'Joe'),
                        Story(imageUrl[5], 'Jean'),
                        Story(imageUrl[6], 'Rasy'),
                        Story(imageUrl[7], 'Sarah'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: ListView(
                children: [
                  Chat(imageUrl[1], 'Rohman', 'You : How are you today?',
                      '10.00 AM', false),
                  Chat(imageUrl[6], '+62 8212228921', 'I\'m rasy from Russia ',
                      '8.15 AM', false),
                  Chat(imageUrl[3], 'Mistuki', 'Nice to meet you falah',
                      '6.15 AM', true),
                  Chat(imageUrl[7], 'Sarah', 'I\'m from USA', '2.00 AM', true),
                  Chat(imageUrl[2], 'Jessica', 'You : What are you doing?',
                      'yesterday', false),
                  Chat(imageUrl[4], 'Joe',
                      'my ML nickname\'s is "Joes_Propler"', 'Tue, 21', true),
                  Chat(imageUrl[0], 'Abdul', 'Hahaha, nice bruh', 'Wed, 22',
                      true),
                  Chat(imageUrl[5], 'Jean', 'Okey', 'Sun, 19', true),
                ],
              ),
            ))
          ],
        ));
  }
}

Widget Story(String imgUrl, String username) {
  return Padding(
    padding: const EdgeInsets.only(right: 12),
    child: Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(imgUrl),
          radius: 35,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          username,
          style: TextStyle(fontSize: 15, color: Colors.white),
        )
      ],
    ),
  );
}

Widget Chat(String imgUrl, String username, String msg, String date, bool see) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imgUrl),
            radius: 28,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      username,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    )),
                    Text(date)
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(child: Text(msg)),
                    if (see) Icon(Icons.check_circle, color: Colors.green),
                    if (!see)
                      Icon(Icons.check_circle_outlined, color: Colors.grey)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
