import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smooth Page Indicator Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController(
    viewportFraction: 0.8,
    keepPage: false,
    initialPage: 0,
  );

  // final pages = List.generate(
  //   3,
  //   (index) => (index == 0)
  //       ? Container(
  //           height: 200,
  //           width: 200,
  //           color: Colors.amber,
  //           child: Center(
  //             child: Text('test1'),
  //           ),
  //         )
  //       : (index == 1)
  //           ? Container(
  //               height: 200,
  //               width: 200,
  //               color: Colors.red,
  //               child: Center(
  //                 child: Text('test2'),
  //               ),
  //             )
  //           : (index == 2)
  //               ? Container(
  //                   height: 200,
  //                   width: 200,
  //                   color: Colors.green,
  //                   child: Center(
  //                     child: Text('test1'),
  //                   ),
  //                 )
  //               : Container(),
  // );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              controller: controller,
              itemCount: 3,
              // itemCount: pages.length,
              itemBuilder: (_, index) {
                return ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    index == 0
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'HOME PAGE',
                                // style: headerFontSt,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'By this page you can visit \n further pages',
                                textAlign: TextAlign.center,
                                // style: nexaFonts,
                              ),
                              SizedBox(
                                height: 65,
                              ),
                              SmoothPageIndicator(
                                controller: controller,
                                count: 3,
                                effect: const WormEffect(
                                  dotHeight: 8,
                                  dotWidth: 16,
                                  spacing: 3,
                                  activeDotColor: Colors.black,
                                  strokeWidth: 1.0,
                                  radius: 4,
                                  // paintStyle: PaintingStyle.stroke,
                                  dotColor: Colors.grey,
                                  type: WormType.normal,
                                  // strokeWidth: 5,
                                ),
                              ),
                              SizedBox(
                                height: 65,
                              ),
                              Flexible(
                                child: Image.asset(
                                  'assets/images/image.two.jpg',
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('button2'),
                              ),
                            ],
                          )
                        : index == 1
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'HOME PAGE',
                                    // style: headerFontSt,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'By this page you can visit \n further pages',
                                    textAlign: TextAlign.center,
                                    // style: nexaFonts,
                                  ),
                                  SmoothPageIndicator(
                                    controller: controller,
                                    count: 3,
                                    effect: const WormEffect(
                                      dotHeight: 16,
                                      dotWidth: 16,
                                      type: WormType.thin,
                                      // strokeWidth: 5,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 65,
                                  ),
                                  Flexible(
                                    child: Image.asset(
                                      'assets/images/image.two.jpg',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text('button2'),
                                  ),
                                ],
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'HOME PAGE',
                                    // style: headerFontSt,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'By this page you can visit \n further pages',
                                    textAlign: TextAlign.center,
                                    // style: nexaFonts,
                                  ),
                                  SmoothPageIndicator(
                                    controller: controller,
                                    count: 3,
                                    effect: const WormEffect(
                                      dotHeight: 16,
                                      dotWidth: 16,
                                      type: WormType.thin,
                                      // strokeWidth: 5,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 65,
                                  ),
                                  Flexible(
                                    child: Image.asset(
                                      'assets/images/image.two.jpg',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text('button2'),
                                  ),
                                ],
                              )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

final colors = const [
  Colors.red,
  Colors.green,
  Colors.greenAccent,
  Colors.amberAccent,
  Colors.blue,
  Colors.amber,
];

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Smooth Page Indicator Demo',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final controller = PageController(viewportFraction: 0.8, keepPage: true);

//   @override
//   Widget build(BuildContext context) {
//     final pages = List.generate(
//         2,
//         (index) => index == 0
//             ? Container()
//             : index == 1
//                 ? Container()
//                 : Container());
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               SizedBox(height: 16),
//               SizedBox(
//                 height: 240,
//                 child: PageView.builder(
//                   controller: controller,
//                   // itemCount: pages.length,
//                   itemBuilder: (_, index) {
//                     return pages[index % pages.length];
//                   },
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(top: 24, bottom: 12),
//                 child: Text(
//                   'Worm',
//                   style: TextStyle(color: Colors.black54),
//                 ),
//               ),
//               Column(
//                 children: [
//                   SmoothPageIndicator(
//                     controller: controller,
//                     count: pages.length,
//                     effect: const WormEffect(
//                       dotHeight: 16,
//                       dotWidth: 16,
//                       type: WormType.thin,
//                       // strokeWidth: 5,
//                     ),
//                   ),
//                 ],
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(top: 16, bottom: 8),
//                 child: Text(
//                   'Jumping Dot',
//                   style: TextStyle(color: Colors.black54),
//                 ),
//               ),

//               Container(
//                 child: SmoothPageIndicator(
//                   controller: controller,
//                   count: pages.length,
//                   effect: const SwapEffect(
//                     dotHeight: 16,
//                     dotWidth: 16,
//                     type: SwapType.yRotation,
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(top: 16, bottom: 12),
//                 child: Text(
//                   'Scrolling Dots',
//                   style: TextStyle(color: Colors.black54),
//                 ),
//               ),
//               SmoothPageIndicator(
//                   controller: controller,
//                   count: pages.length,
//                   effect: const ScrollingDotsEffect(
//                     activeStrokeWidth: 2.6,
//                     activeDotScale: 1.3,
//                     maxVisibleDots: 5,
//                     radius: 8,
//                     spacing: 10,
//                     dotHeight: 12,
//                     dotWidth: 12,
//                   )),
//               // Padding(
//               //   padding: const EdgeInsets.only(top: 16, bottom: 16),
//               //   child: Text(
//               //     'Customizable Effect',
//               //     style: TextStyle(color: Colors.black54),
//               //   ),
//               // ),
//               // Container(
//               //   // color: Colors.red.withOpacity(.4),
//               //   child: SmoothPageIndicator(
//               //     controller: controller,
//               //     count: pages.length,
//               //     effect: CustomizableEffect(
//               //       activeDotDecoration: DotDecoration(
//               //         width: 32,
//               //         height: 12,
//               //         color: Colors.indigo,
//               //         rotationAngle: 180,
//               //         verticalOffset: -10,
//               //         borderRadius: BorderRadius.circular(24),
//               //         // dotBorder: DotBorder(
//               //         //   padding: 2,
//               //         //   width: 2,
//               //         //   color: Colors.indigo,
//               //         // ),
//               //       ),
//               //       dotDecoration: DotDecoration(
//               //         width: 24,
//               //         height: 12,
//               //         color: Colors.grey,
//               //         // dotBorder: DotBorder(
//               //         //   padding: 2,
//               //         //   width: 2,
//               //         //   color: Colors.grey,
//               //         // ),
//               //         // borderRadius: BorderRadius.only(
//               //         //     topLeft: Radius.circular(2),
//               //         //     topRight: Radius.circular(16),
//               //         //     bottomLeft: Radius.circular(16),
//               //         //     bottomRight: Radius.circular(2)),
//               //         borderRadius: BorderRadius.circular(16),
//               //         verticalOffset: 0,
//               //       ),
//               //       spacing: 6.0,
//               //       // activeColorOverride: (i) => colors[i],
//               //       inActiveColorOverride: (i) => colors[i],
//               //     ),
//               //   ),
//               // ),
//               const SizedBox(height: 32.0),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // final colors = const [z
