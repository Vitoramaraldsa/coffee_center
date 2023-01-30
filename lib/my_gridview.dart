import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: <Widget>[
        Image.network(
            'https://images.pexels.com/photos/129207/pexels-photo-129207.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
        Image.network('https://picsum.photos/200/300/?blur'),
        Image.network('https://picsum.photos/200/300/?blur'),
        Image.network('https://picsum.photos/200/300/?blur'),
        Image.network('https://picsum.photos/200/300/?blur'),
        Image.network('https://picsum.photos/200/300/?blur'),
      ],
    );
  }
}
