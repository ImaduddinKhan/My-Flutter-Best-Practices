import 'package:flutter/material.dart';

void main() {
  runApp(MaduPhotography());
}

const List<String> urls = [
  "https://www.meme-arsenal.com/memes/bfe7b67eb4b5cbe15cc41aabf2cebafa.jpg",
  "https://picsum.photos/200/300?random=2",
  "https://images.unsplash.com/photo-1485550409059-9afb054cada4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80",
  "https://picsum.photos/200/300?random=1"
];

class MaduPhotography extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Madu Photography',
      home: Gallery(
        title: "madu gallerey",
        url: urls,
      ),
    );
  }
}

class Gallery extends StatelessWidget {
  final String title;
  final List<String> url;

  Gallery({required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: GridView.count(
        primary: false,
        crossAxisCount: 2,
        children: List.of(urls.map((url) => Photos(url: url))),
      ),
    );
  }
}

class Photos extends StatefulWidget {
  final String url;
  Photos({required this.url});

  @override
  PhotosState createState() => PhotosState(
        url: this.url,
      );
}

class PhotosState extends State<Photos> {
  String url;
  int index = 0;
  PhotosState({required this.url});

  ontap() {
    setState(() {
      if (index >= urls.length - 1) {
        index = 0;
      } else {
        index++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: Image.network(url),
        onTap: ontap,
      ),
    ));
  }
}
