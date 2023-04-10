// import 'dart:async';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:second_home/screens/allHomestayPage.dart';
// import 'package:second_home/services/globals.dart';

// import '../models/dataLoading.dart';
// import '../models/homeViewModel.dart';
// import '../models/soloHome.dart';
// import '../services/class.dart';
// import '../services/functions.dart';
// import 'aboutUsPage.dart';
// import 'ad/uploadAdPage.dart';
// import 'homeStayDetailPage.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final _firestore = FirebaseFirestore.instance;
//   List<OfferSnap> offerSnapshot = [];
//   List<DocumentSnapshot> topPicksSnapshot = [];
//   List<DocumentSnapshot> premiumSnapshot = [];
//   List<DocumentSnapshot> affordableSnapshot = [];
//   int pos = 0;
//   Timer? _timer;
//   final PageController _pageController = PageController();

//   @override
//   void initState() {
//     Timer.periodic(const Duration(seconds: 4), (Timer timer) {
//       if (offerSnapshot.isEmpty) {
//         return;
//       }
//       pos == offerSnapshot.length - 1 ? pos = 0 : pos = pos + 1;
//       if (_pageController.hasClients) {
//         _pageController.animateToPage(
//           pos,
//           duration: const Duration(seconds: 1),
//           curve: Curves.linear,
//         );
//       }
//     });

//     getMyLikes();
//     getOffersData();
//     getDisplayData();
//     super.initState();
//   }

//   getMyLikes() async {
//     if (Hive.box('aboutMe').get('number') == null) {
//       return;
//     }
//     await _firestore
//         .collection('Users')
//         .doc(Hive.box('aboutMe').get('number'))
//         .get()
//         .then((value) {
//       Global.myLikes =List.from( value['likes']);
//     });
//   }

//   @override
//   void dispose() {
//     if (_timer != null) {
//       _timer!.cancel();
//     }

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     return NestedScrollView(
//         headerSliverBuilder: (context, no) => [
//               SliverAppBar(
//                 backgroundColor: Colors.grey[900],
//                 floating: true,
//                 leading: GestureDetector(
//                   onTap: () {},
//                   child: const Padding(
//                       padding: EdgeInsets.all(8),
//                       child: Icon(Icons.home)),
//                 ),
//                 actions: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => const UploadAdPage()));
//                     },
//                     child: const Padding(
//                         padding: EdgeInsets.all(12), child: Icon(Icons.add)),
//                   )
//                 ],
//                 centerTitle: true,
//                 title: const Text(
//                   '2nd-Home',
//                   style: TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.w400),
//                 ),
//                 snap: true,
//               )
//             ],
//         body: Scaffold(
//             body: Container(
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage("assets/whiteP.jpg"), fit: BoxFit.cover)),
//           child: ListView(
//             padding: const EdgeInsets.all(8),
//             // shrinkWrap: true,
//             children: [
//               const SizedBox(
//                 height: 8,
//               ),
//               Container(
//                 width: width - 16,
//                 height: (width - 16) * 9 / 16,
//                 decoration: BoxDecoration(
//                     color: Colors.grey,
//                     borderRadius: BorderRadius.circular(16)),
//                 child: Center(
//                   child: Stack(
//                     children: [
//                       Positioned.fill(
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(16),
//                           child: offerSnapshot.isEmpty
//                               ? Container(
//                                   color: Colors.lightGreen,
//                                   child: const Center(
//                                       child: CircularProgressIndicator()),
//                                 )
//                               : Stack(
//                                   children: [
//                                     PageView.builder(
//                                         itemCount: 4,
//                                         onPageChanged: (int index) {
//                                           setState(() {
//                                             pos = index;
//                                           });
//                                         },
//                                         controller: _pageController,
//                                         itemBuilder: (ctx, idx) {
//                                           return GestureDetector(
//                                             onTap: () {
//                                               SoloHome soloHome =
//                                                   snapToSoloHome(
//                                                       offerSnapshot[pos]
//                                                           .snapshot);
//                                               soloHome.offer =
//                                                   offerSnapshot[pos].offer;
//                                               Navigator.of(context).push(
//                                                   MaterialPageRoute(
//                                                       builder: (context) =>
//                                                           HomeStayDetailPage(
//                                                               soloHome:
//                                                                   soloHome,
//                                                               hasOffer: true)));
//                                             },
//                                             child: Stack(
//                                               children: [
//                                                 Positioned.fill(
//                                                   child: CachedNetworkImage(
//                                                     placeholder: (context,
//                                                             url) =>
//                                                         const Center(
//                                                             child:
//                                                                 CircularProgressIndicator()),
//                                                     imageUrl: offerSnapshot[pos]
//                                                         .snapshot['dpUrl'],
//                                                     fit: BoxFit.fitWidth,
//                                                   ),
//                                                 ),
//                                                 Align(
//                                                   alignment:
//                                                       Alignment.bottomLeft,
//                                                   child: Padding(
//                                                     padding:
//                                                         const EdgeInsets.all(
//                                                             8.0),
//                                                     child: Column(
//                                                       mainAxisSize:
//                                                           MainAxisSize.min,
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .start,
//                                                       children: [
//                                                         Row(
//                                                           children: [
//                                                             Text(
//                                                               ' ₹ ${offerSnapshot[pos].snapshot['price']}',
//                                                               style: TextStyle(
//                                                                   backgroundColor: Colors
//                                                                       .black
//                                                                       .withOpacity(
//                                                                           0.7),
//                                                                   color: Colors
//                                                                       .white,
//                                                                   fontSize: 20,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w400,
//                                                                   decoration:
//                                                                       TextDecoration
//                                                                           .lineThrough),
//                                                             ),
//                                                             const SizedBox(
//                                                               width: 8,
//                                                             ),
//                                                           ],
//                                                         ),
//                                                         const SizedBox(
//                                                           height: 4,
//                                                         ),
//                                                         Text(
//                                                           ' ₹ ${(offerSnapshot[pos]
//                                                                               .snapshot[
//                                                                           'price']) *
//                                                                       (100 -
//                                                                           (offerSnapshot[pos]
//                                                                               .offer)) ~/
//                                                                       100}',
//                                                           style: TextStyle(
//                                                               backgroundColor:
//                                                                   Colors.black
//                                                                       .withOpacity(
//                                                                           0.7),
//                                                               color:
//                                                                   Colors.white,
//                                                               fontSize: 20,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .bold,
//                                                               decoration:
//                                                                   TextDecoration
//                                                                       .none),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Align(
//                                                   alignment:
//                                                       Alignment.bottomRight,
//                                                   child: Padding(
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                             bottom: 8.0),
//                                                     child: Container(
//                                                       decoration: BoxDecoration(
//                                                           shape:
//                                                               BoxShape.circle,
//                                                           color: Colors.black
//                                                               .withOpacity(
//                                                                   0.8)),
//                                                       child: Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .all(16.0),
//                                                         child: Text(
//                                                           '-${offerSnapshot[pos].offer}%',
//                                                           style:
//                                                               const TextStyle(
//                                                             // backgroundColor: Colors.black.withOpacity(0.7),
//                                                             color: Colors.red,
//                                                             fontSize: 18,
//                                                             fontWeight:
//                                                                 FontWeight.bold,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                           );
//                                         }),
//                                   ],
//                                 ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 24,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: const [
//                   Padding(
//                     padding: EdgeInsets.only(left: 4),
//                     child: Text(
//                       'Top Picks :',
//                       style: TextStyle(
//                           // decoration: TextDecoration.underline,
//                           color: Colors.black,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               GridView.count(
//                 padding: const EdgeInsets.only(top: 0),
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 8,
//                 crossAxisSpacing: 8,
//                 childAspectRatio: 0.84,
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 children: topPicksSnapshot.isNotEmpty
//                     ? [
//                         homeViewModel(
//                             context, snapToSoloHome(topPicksSnapshot[0])),
//                         homeViewModel(
//                             context, snapToSoloHome(topPicksSnapshot[1])),
//                         homeViewModel(
//                             context, snapToSoloHome(topPicksSnapshot[2])),
//                         homeViewModel(
//                             context, snapToSoloHome(topPicksSnapshot[3])),
//                       ]
//                     : [
//                         dataLoading(Colors.amber),
//                         dataLoading(Colors.purple),
//                         dataLoading(Colors.deepOrange),
//                         dataLoading(Colors.lightBlue),
//                       ],
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => AllHomestayPage(
//                                 snapshot: premiumSnapshot, type: 1)));
//                       },
//                       child: const CircleAvatar(
//                         backgroundColor: Colors.lightBlue,
//                         child: Center(
//                             child: Icon(
//                           Icons.add,
//                           color: Colors.white,
//                         )),
//                       )),
//                 ],
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: const [
//                   Padding(
//                     padding: EdgeInsets.only(left: 4),
//                     child: Text(
//                       'Premium :',
//                       style: TextStyle(
//                           // decoration: TextDecoration.underline,
//                           color: Colors.black,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               GridView.count(
//                 padding: const EdgeInsets.only(top: 0),
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 mainAxisSpacing: 8,
//                 crossAxisSpacing: 8,
//                 childAspectRatio: 0.8,
//                 crossAxisCount: 2,
//                 children: premiumSnapshot.isNotEmpty
//                     ? [
//                         homeViewModel(
//                             context, snapToSoloHome(premiumSnapshot[0])),
//                         homeViewModel(
//                             context, snapToSoloHome(premiumSnapshot[1])),
//                         homeViewModel(
//                             context, snapToSoloHome(premiumSnapshot[2])),
//                         homeViewModel(
//                             context, snapToSoloHome(premiumSnapshot[3])),
//                       ]
//                     : [
//                         dataLoading(Colors.amber),
//                         dataLoading(Colors.purple),
//                         dataLoading(Colors.deepOrange),
//                         dataLoading(Colors.lightBlue),
//                       ],
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => AllHomestayPage(
//                                 snapshot: premiumSnapshot, type: 1)));
//                       },
//                       child: const CircleAvatar(
//                         backgroundColor: Colors.lightBlue,
//                         child: Center(
//                             child: Icon(
//                           Icons.add,
//                           color: Colors.white,
//                         )),
//                       )),
//                 ],
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: const [
//                   Padding(
//                     padding: EdgeInsets.only(left: 4),
//                     child: Text(
//                       'Affordable :',
//                       style: TextStyle(
//                           // decoration: TextDecoration.underline,
//                           color: Colors.black,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               GridView.count(
//                 padding: const EdgeInsets.only(top: 0),
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 8,
//                 crossAxisSpacing: 8,
//                 childAspectRatio: 0.8,
//                 children: affordableSnapshot.isNotEmpty
//                     ? [
//                         homeViewModel(
//                             context, snapToSoloHome(affordableSnapshot[0])),
//                         homeViewModel(
//                             context, snapToSoloHome(affordableSnapshot[1])),
//                         homeViewModel(
//                             context, snapToSoloHome(affordableSnapshot[2])),
//                         homeViewModel(
//                             context, snapToSoloHome(affordableSnapshot[3])),
//                       ]
//                     : [
//                         dataLoading(Colors.amber),
//                         dataLoading(Colors.purple),
//                         dataLoading(Colors.deepOrange),
//                         dataLoading(Colors.lightBlue),
//                       ],
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => AllHomestayPage(
//                                 snapshot: premiumSnapshot, type: 1)));
//                       },
//                       child: const CircleAvatar(
//                         backgroundColor: Colors.lightBlue,
//                         child: Center(
//                             child: Icon(
//                           Icons.add,
//                           color: Colors.white,
//                         )),
//                       )),
//                 ],
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   Padding(
//                     padding: EdgeInsets.only(left: 4),
//                     child: Text(
//                       '-: Connect with Us :-',
//                       style: TextStyle(
//                           // decoration: TextDecoration.underline,
//                           color: Colors.black,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: const [
//                   CircleAvatar(
//                     backgroundColor: Colors.lightBlue,
//                     child: Center(
//                         child: Icon(
//                       Icons.facebook,
//                       color: Colors.white,
//                     )),
//                   ),
//                   CircleAvatar(
//                     backgroundColor: Colors.lightBlue,
//                     child: Center(
//                         child: Icon(
//                       Icons.wechat,
//                       color: Colors.white,
//                     )),
//                   ),
//                   CircleAvatar(
//                     backgroundColor: Colors.lightBlue,
//                     child: Center(
//                         child: Icon(
//                       Icons.snapchat,
//                       color: Colors.white,
//                     )),
//                   ),
//                   CircleAvatar(
//                     backgroundColor: Colors.lightBlue,
//                     child: Center(
//                         child: Icon(
//                       Icons.reddit,
//                       color: Colors.white,
//                     )),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               GestureDetector(
//                 onTap: (){
//              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AboutUsPage()));
//                 },
//                 child:const Center(
//                   child:  Text('About Us:-',

//                       style: TextStyle(
//                         decoration: TextDecoration.underline,
//                         decorationThickness: 2,
//                        // decoration: InputDecoration.,
//                           color: Colors.black87,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 22)),
//                 ),
//               ),
//               const SizedBox(
//                 height: 48,
//               )
//             ],
//           ),
//         )));
//   }

//   //..........getting data...

//   getOffersData() async {
//     _firestore.collection('Offers').get().then((value) {
//       for (var doc in value.docs) {
//         _firestore.collection('Homestays').doc(doc['id']).get().then((valuex) {
//           setState(() {
//             OfferSnap os = OfferSnap(doc['offer'], valuex);
//             offerSnapshot.add(os);
//           });
//         });
//       }
//     });
//   }

//   //...top picks data...
//   getDisplayData() async {
//     await _firestore
//         .collection("Homestays")
//         .orderBy('rating', descending: true)
//         .limit(4)
//         .get()
//         .then((value) {
//       setState(() {
//         topPicksSnapshot = value.docs;
//       });
//     });
//     await _firestore
//         .collection("Homestays")
//         .orderBy('price', descending: true)
//         .limit(4)
//         .get()
//         .then((value) {
//       setState(() {
//         premiumSnapshot = value.docs;
//       });
//     });
//     await _firestore
//         .collection("Homestays")
//         .orderBy('price')
//         .limit(4)
//         .get()
//         .then((value) {
//       setState(() {
//         affordableSnapshot = value.docs;
//       });
//     });
//   }
// }