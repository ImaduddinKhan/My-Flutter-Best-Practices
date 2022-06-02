// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: SfRadialGauge(axes: [
//           RadialAxis(
//             minimum: 0,
//             maximum: 100,
//             showLabels: false,
//             showTicks: false,
//             startAngle: 270,
//             endAngle: 270,
//             axisLineStyle: const AxisLineStyle(
//               thickness: 0.05,
//               thicknessUnit: GaugeSizeUnit.factor,
//             ),
//             pointers: const <GaugePointer>[
//               RangePointer(
//                   value: 50,
//                   width: 0.1,
//                   sizeUnit: GaugeSizeUnit.factor,
//                   cornerStyle: CornerStyle.startCurve,
//                   gradient: SweepGradient(
//                       colors: <Color>[Color(0xFF00a9b5), Color(0xFFa4edeb)],
//                       stops: <double>[0.25, 0.75])),
//               MarkerPointer(
//                 value: 59,
//                 markerType: MarkerType.rectangle,
//                 color: Color(0xFF87e8e8),
//               )
//             ],
//           ),
//         ],
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: avoid_web_libraries_in_flutter

/* ===================================================================================== */

// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: _title,
//       home: MyStatefulWidget(),
//     );
//   }
// }

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);

//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// /// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
// class _MyStatefulWidgetState extends State<MyStatefulWidget>
//     with TickerProviderStateMixin {
//   late AnimationController controller;

//   @override
//   void initState() {
//     controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 5),
//     )..addListener(() {
//         setState(() {});
//       });
//     controller.repeat(reverse: false);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             Container(
//               alignment: Alignment.center,
//               height: 197,
//               width: 197,
//               decoration: BoxDecoration(
//                 color: Colors.amber,
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(110),
//                 ),
//                 border: Border.all(
//                   width: 1,
//                   color: Colors.grey,
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   Text('test'),
//                   Text('test'),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 200,
//               width: 200,
//               child: CircularProgressIndicator(
//                 backgroundColor: Colors.amber,
//                 strokeWidth: 6,
//                 value: controller.value,
//                 semanticsLabel: 'Linear progress indicator',
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

/* ===================================================================================== */

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'dart:html' as html;
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CSC Picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SamplePage())),
              child: Text('Sample 1'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => PhotosHistoryAddPage())),
              child: Text('Photo History'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => BigVideoUploadView())),
              child: Text('Big Video Upload'),
            ),
          ],
        ),
      ),
    );
  }
}

const Color kDarkGray = Color(0xFFA3A3A3);
const Color kLightGray = Color(0xFFF1F0F5);

class PhotosHistoryAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ImagePickerWidget();
}

enum PageStatus { loading, error, loaded }

class ImagePickerWidget extends StatefulWidget {
  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final _photos = <Image>[];
  PageStatus _pageStatus = PageStatus.loaded;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Photo History')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _photos.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _buildAddPhoto();
                }
                var image = _photos[index - 1];
                return Stack(
                  children: <Widget>[
                    InkWell(
                      child: Container(
                          margin: EdgeInsets.all(5),
                          height: 100,
                          width: 100,
                          color: kLightGray,
                          child: image),
                    ),
                  ],
                );
              },
            ),
          ),
          if (_pageStatus == PageStatus.loaded)
            Container(
              margin: EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Save'),
              ),
            )
        ],
      ),
    );
  }

  InkWell _buildAddPhoto() {
    if (_pageStatus == PageStatus.loading) {
      return InkWell(
        onTap: () => null,
        child: Container(
          margin: EdgeInsets.all(5),
          height: 100,
          width: 100,
          color: kDarkGray,
          child: Center(child: Text('Please wait..')),
        ),
      );
    } else {
      return InkWell(
        onTap: () => _onAddPhotoClicked(context),
        child: Container(
          margin: EdgeInsets.all(5),
          height: 100,
          width: 100,
          color: kDarkGray,
          child: Center(
            child: const Icon(
              Icons.add_to_photos,
              color: kLightGray,
            ),
          ),
        ),
      );
    }
  }

  Future<void> _onAddPhotoClicked(context) async {
    setState(() {
      _pageStatus = PageStatus.loading;
    });

    final image = await ImagePickerWeb.getImageAsWidget();
    print(image);

    if (image != null) {
      setState(() {
        _photos.add(image);
        _pageStatus = PageStatus.loaded;
      });
    } else {
      setState(() {
        _pageStatus = PageStatus.loaded;
      });
    }
  }
}

class BigVideoUploadView extends StatefulWidget {
  const BigVideoUploadView({Key? key}) : super(key: key);

  @override
  State<BigVideoUploadView> createState() => _BigVideoUploadViewState();
}

class _BigVideoUploadViewState extends State<BigVideoUploadView> {
  VideoPlayerController? _controller;

  Future<void> _createVideo(Uint8List bytes) async {
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    _controller = VideoPlayerController.network(url);
    await _controller?.initialize();
    setState(() {});
  }

  Future<Uint8List> _loadImage(html.File file) async {
    final reader = html.FileReader();
    reader.readAsArrayBuffer(file);
    await reader.onLoad.first;
    reader.onLoadEnd;
    return reader.result as Uint8List;
  }

  Future<void> _pickAndLoadVideo() async {
    final file = await ImagePickerWeb.getVideoAsFile();
    if (file != null) {
      final bytes = await _loadImage(file);
      await _createVideo(bytes);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;
    return Scaffold(
      appBar: AppBar(title: const Text('Big Video Upload')),
      floatingActionButton: controller != null
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  controller.value.isPlaying
                      ? controller.pause()
                      : controller.play();
                });
              },
              child: Icon(
                controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            )
          : null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (controller != null && controller.value.isInitialized)
              AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              ),
            ElevatedButton(
              onPressed: _pickAndLoadVideo,
              child: Text('Load Video with FileReader'),
            ),
          ],
        ),
      ),
    );
  }
}

class SamplePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  final _pickedImages = <Image>[];
  final _pickedVideos = <dynamic>[];

  String _imageInfo = '';

  Future<void> _pickImage() async {
    final fromPicker = await ImagePickerWeb.getImageAsWidget();
    if (fromPicker != null) {
      setState(() {
        _pickedImages.clear();
        _pickedImages.add(fromPicker);
      });
    }
  }

  Future<void> _pickVideo() async {
    final videoMetaData = await ImagePickerWeb.getVideoAsBytes();
    if (videoMetaData != null) {
      setState(() {
        _pickedVideos.clear();
        _pickedVideos.add(videoMetaData);
      });
    }
  }

  Future<void> _pickMultiImages() async {
    final images = await ImagePickerWeb.getMultiImagesAsWidget();
    setState(() {
      _pickedImages.clear();
      if (images != null) _pickedImages.addAll(images);
    });
  }

  Future<void> _getImgFile() async {
    final infos = await ImagePickerWeb.getImageAsFile();
    setState(() => _imageInfo =
        'Name: ${infos?.name}\nRelative Path: ${infos?.relativePath}');
  }

  Future<void> _getImgInfo() async {
    final infos = await ImagePickerWeb.getImageInfo;
    final data = infos?.data;
    if (data != null) {
      setState(() {
        _pickedImages.clear();
        _pickedImages.add(Image.memory(data, semanticLabel: infos?.fileName));
        _imageInfo = '${infos?.toJson()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample 1'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Wrap(
                // spacing: 15.0,
                children: <Widget>[
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    switchInCurve: Curves.easeIn,
                    child: SizedBox(
                      width: 500,
                      height: 200,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _pickedImages.length,
                          itemBuilder: (_, index) => _pickedImages[index]),
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    child: Text(_imageInfo, overflow: TextOverflow.ellipsis),
                  ),
                  ..._pickedVideos
                      .map<Widget>((e) => Text(
                            e.toString(),
                            overflow: TextOverflow.ellipsis,
                          ))
                      .toList(),
                ],
              ),
              ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
                ElevatedButton(
                  onPressed: _pickImage,
                  child: const Text('Select Image'),
                ),
                ElevatedButton(
                  onPressed: _pickVideo,
                  child: const Text('Select Video'),
                ),
                ElevatedButton(
                  onPressed: _pickMultiImages,
                  child: const Text('Select Multi Images'),
                ),
                ElevatedButton(
                  onPressed: _getImgFile,
                  child: const Text('Get Image File'),
                ),
                ElevatedButton(
                  onPressed: _getImgInfo,
                  child: const Text('Get Image Info'),
                ),
              ]),
            ]),
      ),
    );
  }
}
