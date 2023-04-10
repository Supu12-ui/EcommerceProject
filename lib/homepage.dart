import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/plusService.dart';

import 'salonForWomen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pos = 0;
  Timer? _timer;
  final PageController _pageController = PageController();
  List<Image> showImages = [
    Image(image: AssetImage("assets/r-1.png")),
    Image(image: AssetImage("assets/p.png")),
    Image(image: AssetImage("assets/z.png")),
    Image(image: AssetImage("assets/m.png")),
  ];
  List<Text> text1 = [
    Text("Search for"),
    Text("S"),
    Text("e"),
    Text("r"),
    Text("v"),
    Text("c"),
    Text("i"),
    Text("e"),
    Text("s")
  ];
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      pos == 3 ? pos = 0 : pos = pos + 1;
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          pos,
          duration: const Duration(seconds: 1),
          curve: Curves.linear,
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        ListView(
          shrinkWrap: true,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.location_on,
                    color: Colors.black,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: const Text('Your Location Here'),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              color: Colors.black,
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Container(
                height: 42,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 4, 69, 122),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Search for services",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ]),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Divider(
              height: 2,
            ),
            ElevatedButton(
              onPressed: () {
                // Add your button press logic here
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PlusService()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white), // Set the background color of the button
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 10 / 100,
                      child: Image.asset("assets/h.png"),
                    ),
                  ),
                  Text(
                    "Plus",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.cyanAccent[400],
                    ),
                  ),
                  SizedBox(width: 8),
                  Text("Save upto 10% on every service",
                      style: TextStyle(color: Colors.black)),
                  Padding(
                    padding: const EdgeInsets.only(left: 45.0, right: 0.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 24,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 12),
            Container(
              width: MediaQuery.of(context).size.width * 72 / 100,
              height: MediaQuery.of(context).size.width * 48 / 100,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(16)),
              child: Center(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Stack(
                          children: [
                            PageView.builder(
                                itemCount: 4,
                                onPageChanged: (int index) {
                                  setState(() {
                                    pos = index;
                                  });
                                },
                                controller: _pageController,
                                itemBuilder: (ctx, idx) {
                                  return Stack(
                                    children: [
                                      Positioned.fill(child: showImages[pos]),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    ' 15% off on every booking',
                                                    style: TextStyle(
                                                        backgroundColor: Colors
                                                            .black
                                                            .withOpacity(0.7),
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough),
                                                  ),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                ' Book Now',
                                                style: TextStyle(
                                                    backgroundColor: Colors
                                                        .black
                                                        .withOpacity(0.7),
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    decoration:
                                                        TextDecoration.none),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black
                                                    .withOpacity(0.8)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Text(
                                                'Hello',
                                                style: const TextStyle(
                                                  // backgroundColor: Colors.black.withOpacity(0.7),
                                                  color: Colors.red,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),

            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SalonForWomen(type: 0)));
                  },
                  child: smallCont(
                      const Image(image: AssetImage("assets/c.png")),
                      'salon for women'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SalonForWomen(type: 1)));
                  },
                  child: smallCont(
                      const Image(image: AssetImage("assets/f.png")), 'spa'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SalonForWomen(type: 2)));
                  },
                  child: smallCont(
                      const Image(image: AssetImage("assets/e.png")),
                      'ac services & repairs'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SalonForWomen(type: 3)));
                  },
                  child: smallCont(
                      const Image(image: AssetImage("assets/g.png")),
                      'salon for men'),
                ),
              ],
            ),
            Row(
              children: [
                smallCont(const Image(image: AssetImage("assets/b.png")),
                    'carpenter'),
                smallCont(
                    const Image(image: AssetImage("assets/a.png")), 'plumbing'),
                smallCont(const Image(image: AssetImage("assets/d.png")),
                    'electrician'),
                smallCont(
                    const Image(image: AssetImage("assets/a.png")), 'others'),
              ],
            ),
            Container(
              //  color: Colors.red,
              height: MediaQuery.of(context).size.width * 42 / 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      //  color: Colors.indigo,
                      width: MediaQuery.of(context).size.width * 50 / 100,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Image.asset('assets/i.png'),
                      )),
                  Image.asset(
                    'assets/o.png',
                    width: MediaQuery.of(context).size.width * 42 / 100,
                  ),
                ],
              ),
            ),
            Text('New Category Launch'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                bigCont(const Image(image: AssetImage("assets/q.png")),
                    'electrician'),
                bigCont(const Image(image: AssetImage("assets/v.png")),
                    'electrician'),
              ],
            ),
            allServiceButton(),
            Text('Ac Reparings'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                bigCont(const Image(image: AssetImage("assets/p.png")),
                    'electrician'),
                bigCont(const Image(image: AssetImage("assets/u.png")),
                    'electrician'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                bigCont(const Image(image: AssetImage("assets/r.png")),
                    'electrician'),
                bigCont(const Image(image: AssetImage("assets/w.png")),
                    'electrician'),
              ],
            ),
            allServiceButton(),
            ////////////////////////////////////////////////////////////////////////
            Text('Ac Reparings'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                bigCont(const Image(image: AssetImage("assets/r.png")),
                    'electrician'),
                bigCont(const Image(image: AssetImage("assets/r.png")),
                    'electrician'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                bigCont(const Image(image: AssetImage("assets/r.png")),
                    'electrician'),
                bigCont(const Image(image: AssetImage("assets/r.png")),
                    'electrician'),
              ],
            ),
            allServiceButton(),
            Text('Ac Reparings'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                bigCont(const Image(image: AssetImage("assets/r.png")),
                    'electrician'),
                bigCont(const Image(image: AssetImage("assets/r.png")),
                    'electrician'),
              ],
            ),

            allServiceButton(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 20 / 100,
            ),
            Container(
              height: 200,
              color: Colors.blueGrey,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.wallet),
                        Icon(Icons.wallet),
                        SizedBox(
                          width: 16,
                        ),
                        Icon(Icons.wallet),
                        Icon(Icons.wallet),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: Icon(Icons.wallet, size: 40),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
//Image(),
          ],
        ),
        Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: 100, left: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.phone, color: Colors.red, size: 28),
                  SizedBox(height: 8),
                  Icon(Icons.phone, color: Colors.green, size: 28),
                ],
              ),
            ))
      ],
    ));
  }

  ///.......widgets........

  Widget smallCont(Image image, String title) {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 0.4)),
      width: MediaQuery.of(context).size.width * 25 / 100,
      height: MediaQuery.of(context).size.width * 25 / 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 16 / 100,
              height: MediaQuery.of(context).size.width * 16 / 100,
              child: image),
          Text(title),
        ],
      ),
    );
  }

  Widget bigCont(Image image, String title) {
    return Container(
      width: MediaQuery.of(context).size.width * 44 / 100,
      //  height: MediaQuery.of(context).size.width * 25 / 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          image,
          Text(title),
        ],
      ),
    );
  }

  Widget allServiceButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("View All Services"),
        )),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
