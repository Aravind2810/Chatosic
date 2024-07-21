import 'package:flutter/material.dart';

@Deprecated("Still in development do not use")
enum OrderedList {
  bullet, numbers, alphabets, alphanumeric
}

Widget headingText(String text) {
  return Padding(padding: const EdgeInsets.all(12), child:
  Text(text, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)));
}

Widget subHeadingText(String text) {
  return Padding(padding: const EdgeInsets.all(8),child:
  Text(text, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)));
}

Widget caption(String text) {
  return Padding(padding: const EdgeInsets.all(6),child:
  Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic)));
}

// TODO: Still in construction do not use
@Deprecated("Still in development do not use")
Widget orderedBodyText(String text, OrderedList orderedList, int count) {
  switch (orderedList) {
    case OrderedList.bullet:
      return ListTile(
          leading: const Icon(Icons.fiber_manual_record),
          title: Padding(padding: const EdgeInsets.all(6),child:
          Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal)))
      );
    case OrderedList.alphabets:
      return ListTile(
          leading: const Icon(Icons.abc),
          title: Padding(padding: const EdgeInsets.all(6),child:
          Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal)))
      );
    case OrderedList.alphanumeric:
      return ListTile(
          title: Padding(padding: const EdgeInsets.all(6),child:
          Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal)))
      );
    case OrderedList.numbers:
      return ListTile(
          title: Padding(padding: const EdgeInsets.all(6),child:
          Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal)))
      );
    default:
      return ListTile(
          leading: const Icon(Icons.fiber_manual_record),
          title: Padding(padding: const EdgeInsets.all(6),child:
          Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal)))
      );
  }

}

Widget bodyText(String text) {
  return Padding(padding: const EdgeInsets.all(6),child:
  Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal)));
}

Widget colorText(String text, Color color) {
  return Padding(padding: const EdgeInsets.all(6),child:
  Text(text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: color)));
}